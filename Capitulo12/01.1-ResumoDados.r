# Estatistica Basica

# Parte 1 - Medidas de Posicao

# Definindo o caminho onde estara o arquivo com os dados:

setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

# Conferir o caminho do diretorio dos arquivos:

getwd()

# Carregar o Arquivo com os dados:

vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

# Carrega a visualizacao da Tabela de Dados Carregada:

View(vendas)

# Apresenta um resumo de cada coluna da Tabela de Dados Carregada:

str(vendas)

# Carrega um sumario da variavel Valor:

summary(vendas$Valor)

# Carrega um sumario da variavel Custo:

summary(vendas$Custo)

# Carrega o sumario de todas as variaveis da tabela:

summary(vendas)