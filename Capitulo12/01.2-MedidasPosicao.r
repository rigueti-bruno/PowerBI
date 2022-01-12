# Definindo o caminho onde estar� o arquivo com os dados:

setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

# Conferir o caminho do diret�rio dos arquivos:

getwd()

# Carregar o Arquivo com os dados:

vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

# M�dia da vari�vel Valor:
mean(vendas$Valor)

# M�dia da vari�vel Custo:
mean(vendas$Custo)

# M�dia da Vari�vel Valor ponderada pela Vari�vel Custo:

weighted.mean(vendas$Valor, w = vendas$Custo)

# Mediana da vari�vel Valor:

median(vendas$Valor)

# Mediana da vari�vel Custo:

median(vendas$Custo)

# Criando a Fun��o Moda:

moda <- function(v) {
  valor_unico <- unique(v)
  valor_unico[which.max(tabulate(match(v, valor_unico)))]
}

# Obtendo a moda da Vari�vel Valor:

resultado <- moda(vendas$Valor)
resultado

# Obtendo a moda da Vari�vel Custo:

resultado <- moda(vendas$Custo)
print(resultado)