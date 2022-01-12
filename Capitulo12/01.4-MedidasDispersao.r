# Definindo o caminho onde estará o arquivo com os dados:

setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

# Conferir o caminho do diretório dos arquivos:

getwd()

# Carregar o Arquivo com os dados:

vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

# Função da Variância para a variável Valor:

var(vendas$Valor)

# Função do Desvio Padrão para a variáveç Valor:

sd(vendas$Valor)