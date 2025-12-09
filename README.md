# ☀️ Análise Wavelet Contínua (CWT) de Dados Ionosféricos - São José dos Campos, Araguatins e Jataí

Este repositório contém um conjunto de scripts MATLAB desenvolvidos para realizar a **Análise Wavelet Contínua (CWT)** dos parâmetros ionosféricos **foF2**, **h'F** e **hmF2**, provenientes das estações:

- **São José dos Campos (SP)**
- **Araguatins (TO)**
- **Jataí (GO)**

O período analisado foi de **01/08/2017 a 31/08/2017**, com passo temporal de **5 minutos**.  
O objetivo é investigar a variabilidade temporal e as periodicidades das camadas superiores da ionosfera a partir da Transformada Wavelet.

---

## 🛠 Tecnologias Usadas

- **MATLAB (R2019b ou superior recomendado)**
- **Wavelet Toolbox**
- **Dados ionosféricos reduzidos via UDIDA**

![MATLAB Badge](https://img.shields.io/badge/MATLAB-R2019b-orange?logo=Mathworks&logoColor=white)

---

## 💡 Objetivo

O projeto realiza a análise espectral de três parâmetros ionosféricos:

- **foF2** — frequência crítica da camada F2  
- **hmF2** — altura máxima da camada F2  
- **h'F** — altura virtual da camada F  

Cada estação possui seu próprio conjunto de dados e seu respectivo script de análise CWT.

O método permite:

- 🌀 Identificação de periodicidades entre **0,25 a 31 dias**
- 🔍 Localização temporal de eventos ionosféricos significativos
- 🌙 Observação de variações diurnas e noturnas
- 🧽 Tratamento consistente de dados ausentes (NaN)
- 📊 Geração de mapas espectrais tempo–período de alta resolução

---

## 📊 Funcionalidades

- 📁 Leitura de dados reduzidos para cada estação  
- 🕒 Construção automática do vetor temporal (5 min de resolução)  
- 🌀 Cálculo da **CWT** usando `cwtfilterbank`  
- 🧱 Extensão do sinal para reduzir efeitos de borda  
- 🎨 Visualizações com:  
  - Escala **log2(period)**  
  - Transparência automática em regiões com NaN  
  - Colormap **jet**  
  - Ticks diários no eixo do tempo  
- 📈 Geração de 3 gráficos por estação:  
  - CWT de **foF2**  
  - CWT de **h'F**  
  - CWT de **hmF2**  

---

## 📂 Estrutura do Projeto

```
analise-cwt-ionosfera/
├── dados/
│ ├── mediasionosfericasSJC.mat
│ ├── mediasionosfericasARG.mat
│ ├── mediasionosfericasJAT.mat
│ └── (outros arquivos necessários)
│
├── codigo_cwt_sjc.m # Script da estação SJC (SP)
├── codigo_cwt_arg.m # Script da estação Araguatins (TO)
├── codigo_cwt_jatai.m # Script da estação Jataí (GO)
│
└── README.md # Este arquivo
```

---

## ▶️ Como Executar o Projeto

1. Clone o repositório:

```bash
git clone https://github.com/lauratrigo/Analise_CWT_Ionosfera_2017.git
cd Analise_CWT_Ionosfera_2017
```

2. Abra o MATLAB.

3. Escolha o script da estação desejada:
  3.1 codigo_cwt_sjc.m
  3.2 codigo_ct_arg.m
  3.3 codigo_cwt_jatai.m

4. Garanta que o arquivo .mat correspondente esteja no mesmo diretório.

5. Execute:
```bash
run CWT_ParametrosIMFAug2017ARG.m
```
ou
```bash
run CWT_ParametrosIMFAug2017JAT.m
```
ou
```bash
run CWT_ParametrosIMFAug2017SJC.m
```
Cada script irá gerar 3 gráficos wavelet (foF2, h'F, hmF2).

---

## 🧪 Dados Utilizados

Os arquivos `.mat` carregam as seguintes séries temporais:

- **foF2**
- **h'F**
- **hmF2**

Esses dados foram previamente:

- reduzidos com o software **UDIDA**
- validados manualmente
- organizados para análise espectral

**Período total analisado:**

01/08/2017 — 31/08/2017

---

## 📈 Exemplos de Saída
### São José dos Campos (SP)

<div align="center">
  <h4><strong>Figura 1: foF2 - SJC</strong></h4>
  <img src="images/sjc_fof2.png" alt="CWT foF2 SJC" style="width:80%; max-width:900px;">
</div>

<div align="center">
  <h4><strong>Figura 2: h'F - SJC</strong></h4>
  <img src="images/sjc_hF.png" alt="CWT hF SJC" style="width:80%; max-width:900px;">
</div>

<div align="center">
  <h4><strong>Figura 3: hmF2 - SJC</strong></h4>
  <img src="images/sjc_hmF2.png" alt="CWT hmF2 SJC" style="width:80%; max-width:900px;">
</div>

---

### Araguatins (TO)

<div align="center">
  <h4><strong>Figura 4: foF2 - Araguatins</strong></h4>
  <img src="images/arg_fof2.png" alt="CWT foF2 Araguatins" style="width:80%; max-width:900px;">
</div>

<div align="center">
  <h4><strong>Figura 5: h'F - Araguatins</strong></h4>
  <img src="images/arg_hF.png" alt="CWT hF Araguatins" style="width:80%; max-width:900px;">
</div>

<div align="center">
  <h4><strong>Figura 6: hmF2 - Araguatins</strong></h4>
  <img src="images/arg_hmF2.png" alt="CWT hmF2 Araguatins" style="width:80%; max-width:900px;">
</div>

---

### Jataí (GO)

<div align="center">
  <h4><strong>Figura 7: foF2 - Jataí</strong></h4>
  <img src="images/jat_fof2.png" alt="CWT foF2 Jataí" style="width:80%; max-width:900px;">
</div>

<div align="center">
  <h4><strong>Figura 8: h'F - Jataí</strong></h4>
  <img src="images/jat_hF.png" alt="CWT hF Jataí" style="width:80%; max-width:900px;">
</div>

<div align="center">
  <h4><strong>Figura 9: hmF2 - Jataí</strong></h4>
  <img src="images/jat_hmF2.png" alt="CWT hmF2 Jataí" style="width:80%; max-width:900px;">
</div>

---

## 🤝 Agradecimentos

Este projeto foi desenvolvido como parte de um trabalho de pesquisa em Física Espacial no IP&D/UNIVAP, com apoio do grupo de estudos em ionosfera.

---

## 📜 Licença

Este repositório está licenciado sob a Licença MIT. Consulte o arquivo LICENSE para mais informações.
