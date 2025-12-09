clc; clear; close all;

% --- 1) Carregar os dados
data = load('mediasionosfericasJAT.mat');
foF2 = data.foF2;
hF = data.hF;
hmF2 = data.hmF2;

% --- 2) Criar vetor de tempo (assumindo passo de 5 min)
start_time = datetime('01-Aug-2017 00:00', 'InputFormat', 'dd-MMM-yyyy HH:mm');
time_datetime = start_time + minutes(0:5:(length(foF2)-1)*5);
xnum = datenum(time_datetime);

% --- 3) Organizar os sinais e os nomes
sinais = {foF2, hF, hmF2};
nomesFisicos = {'foF2 - Jataí (GO)', 'hF - Jataí (GO)', 'hmF2 - Jataí (GO)'};

% --- 4) Loop de análise CWT
for k = 1:length(sinais)
    sig2 = sinais{k};
    nomeFisico = nomesFisicos{k};

    mask_nan = isnan(sig2(:))';
    sig2(isnan(sig2)) = 0;
    sig2 = sig2(:);
    n = numel(sig2);

    left2 = flipud(sig2);
    sig2_ext = [left2; left2; sig2; left2; left2];

    fs = 1/300;  % 5 minutos em Hz
    sig2_ext(isnan(sig2_ext)) = 0;

    fb = cwtfilterbank('SignalLength', numel(sig2_ext), ...
                       'SamplingFrequency', fs, ...
                       'FrequencyLimits', [1e-7 1e-4]);

    [wt, f, coi] = cwt(sig2_ext, 'FilterBank', fb);
    period = (1 ./ f) ./ (60*60*24);

    wt_central = wt(:, 2*n+1 : 3*n);
    coi_central = coi(2*n+1 : 3*n);
    W = abs(wt_central).^2;
    W(:, mask_nan) = NaN;
    
    

    figure('Name',['CWT - Ionosfera ' nomeFisico]);
    h = pcolor(xnum, log2(period), W ./ max(W(:)));
    set(h, 'EdgeColor', 'none');
    set(gca, 'Color', 'w');
    set(h, 'AlphaData', ~isnan(W));
    set(h, 'FaceAlpha', 'flat');
colormap jet;
c = colorbar;                  % salva o handle corretamente
c.Limits = [0 1];
c.Ticks = 0.1:0.1:0.9;
c.TickLabels = string(c.Ticks);
c.Label.FontSize = 16;
c.Label.FontName = 'Arial';


    ax = gca;
    
    % Definir datas de início e fim explicitamente
    startDate = datetime('01-Aug-2017', 'InputFormat', 'dd-MMM-yyyy');
    endDate = datetime('31-Aug-2017', 'InputFormat', 'dd-MMM-yyyy');
    
    % Criar vetor de ticks - um para cada dia
    xticks_dates = startDate:days(2):endDate;
    xticks_values = datenum(xticks_dates);
    
    % Configurar os ticks no eixo X
    ax.XTick = xticks_values;
    ax.XTickLabel = datestr(xticks_dates, 'dd');
    ax.XTickLabelRotation = 90;
    
    % Forçar os limites do eixo X para cobrir todo o período
    ax.XLim = [datenum(startDate), datenum(endDate) + 1 - eps];

    desired_periods = [0.25 0.5 1 2 4 8 16 31];
    ax.YTick = log2(desired_periods);
    ax.YTickLabel = string(desired_periods);

ax.FontName = 'Arial';
ax.FontSize = 16;           % tamanho dos números nos eixos

% Fonte dos labels dos eixos
xlabel('Time (days)', 'FontSize', 16, 'FontName', 'Arial', 'FontWeight', 'bold');
ylabel('Period (days)', 'FontSize', 16, 'FontName', 'Arial', 'FontWeight', 'bold');

% Fonte do título
title(['CWT - ' nomeFisico], 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Arial');


    hold on;
    %plot(xnum, log2(coi_central), 'k--', 'LineWidth', 1.5);
    hold off;
    
    % Melhorar a visualização das grades verticais
    grid on;
    ax.GridAlpha = 0.3;
    ax.GridColor = [0.5 0.5 0.5];
    ax.GridLineStyle = '-';
    %ax.XColor = 'r';
    ax.LineWidth = 1.5;        % engrossar linhas dos ticks e borda do eixo
    ax.TickLength = [0.02 0.04]; % deixar os ticks maiores
 
    % -------------------------------------------------------------
    % ? COLAR AQUI — TRECHO PARA SALVAR CADA FIGURA
    % -------------------------------------------------------------
    
    % Nome curto dos parâmetros
    parametros_curto = {'foF2','hF','hmF2'};
    parametro_curto = parametros_curto{k};

    % Defina a estação deste script (ARG, SJC ou JAT)
    estacao = 'JAT';  

    % Criar pasta se não existir
    if ~exist('imagens', 'dir')
        mkdir('imagens');
    end

    % Nome final
    arquivo = fullfile('imagens', sprintf('%s_%s.png', estacao, parametro_curto));

    % Salvar imagem
    saveas(gcf, arquivo);

    % -------------------------------------------------------------
end