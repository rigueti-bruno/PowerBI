# Instalando o pacote de gráficos ggplot2:

install.packages("ggplot2")

# Carregando o pacote fr gráficos ggplot2:

library(ggplot2)

# Definindo o caminho onde estará o arquivo com os dados:

setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

# Conferir o caminho do diretório dos arquivos:

getwd()

# Carregar o Arquivo com os dados:

vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

# Criando um gráfico com o gglot2 e os dados carregados:

ggplot(vendas) +
  stat_summary(aes(x = Estado,
                   y = Valor),
               fun = mean,
               geom = "bar",
               fill = "lightgreen",
               col = "grey50") +
  labs(title = "Média de Valor por Estado")