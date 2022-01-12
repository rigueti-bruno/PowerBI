setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

# Dados:

grupo = c(rep("grupo-1",4), rep("grupo-2",2), rep("grupo-3",3))

subgrupo = paste("subgroup", c(1,2,3,4,1,2,1,2,3), sep="-")

valor = c(13,5,22,12,11,7,3,1,23)

dados = data.frame(grupo,subgrupo,valor)

View(dados)

# Instalar e carregar o pacote Treemap:

install.packages("treemap")
library(treemap)

# Criando o Grafico Treemap:

treemap(dados,
        index = c("grupo","subgrupo"), # atribui os rotulos
        vSize = "valor", # atribui o tamanho dos blocos
        type = "index",
        fontsize.labels = c(15,12), # tamanho da fonte dos rotulos
        fontcolor.labels = c("white","orange"), # cor da fonte dos rotulos
        fontface.labels = c(2,1),
        bg.labels = 220, 
        align.labels = list(c("center","center"),c("right","bottom")), #alinhamento dos rotulos
        overlap.labels = 0.5,
        inflate.labels = F)

# Criando o Histograma:

#Dados:

x <- mtcars$mpg

#Criando o Grafico do histograma:

h <- hist(x,
          breaks = 10,
          col = "red",
          xlab = "Milhas por Galão",
          main = "Histograma com Curva de Distribuição")

# Incluindo uma Curva de Distribuicao de Probabilidade:

xfit <- seq(min(x),max(x),length = 40)

yfit <- dnorm(xfit, mean=mean(x),sd=sd(x))

yfit <- yfit * diff(h$mids[1:2]) * length(x)

lines(xfit, #eixo x
      yfit, #eixo y
      col = "blue", #cor da linha 
      lwd = 2, #largura da linha
      type = "l") #tipo de linha

#o grafico da funcao lines precisa ser carregado simultaneamente ao grafico do histograma

# Criando Histograma com ggplot2:

library(ggplot2)

# Dados:

dados = data.frame(value=rnorm(10000))

# Tamanho das colunas - criando o histograma:

ggplot(dados, # atribui os dados
       aes(x=value))+ #atribui o eixo x
  geom_histogram(binwidth=0.05) #cria as colunas do histograma

#Atribui cor Uniforme as Colunas:

ggplot(dados,
       aes(x=value))+
  geom_histogram(binwidth=0.2, #atribui a largura das colunas
                 color="white", #atribui a cor no contorno das colunas
                 fill = rgb(0.2,0.7,0.1,0.4)) #atribui uma cor no preenchimento das colunas

#Atribui cor as Colunas de acordo com a concentracao de valores:

ggplot(dados,
       aes(x=value))+
  geom_histogram(binwidth=0.2, #atribui a largura das colunas
                 aes(fill=..count..)) #atribui cor as colunas de acordo com a concentracao
