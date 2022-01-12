# Definindo o caminho onde estará o arquivo com os dados:

setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

# Conferir o caminho do diretório dos arquivos:

getwd()

# Carregar o Arquivo com os dados:

vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

# Resumo de Dados:

# Primeiras Linhas:
head(vendas)

# Últimas Linhas:
tail(vendas)

# Tabela completa:
View(vendas)

# Resumo - Medidas de Tendência Central:

# Única Variável:
summary(vendas$Valor)

# Múltiplas Variáveis:
summary(vendas[c('Valor', 'Custo')])



# Medidas de Posição Relativa

# Calculo dos Quartis de uma Variável:
quantile(vendas$Valor)

# Calculo de Percentis Específicos de uma Variável;
quantile(vendas$Valor, probs = c(0.01, 0.99))

# Calculo de uma Sequencia de Percentis de uma Variável:
quantile(vendas$Valor, seq(from = 0, to = 1, by = 0.20))

# Calculo do Intervalo Interquartil - Q3 - Q1:
IQR(vendas$Valor)

# Retorno dos Valores Mínimo e Máximo de uma Variável:
range(vendas$Valor)

# Calculo da Diferença entre os Valores Mínimo e Máximo de uma Variável:
diff(range(vendas$Valor))