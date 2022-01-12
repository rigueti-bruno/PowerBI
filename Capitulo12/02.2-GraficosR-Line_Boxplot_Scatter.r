setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

# Criando os Dados:

carros <- c(1,3,6,4,9)
caminhoes <- c(2,5,4,5,12)

# Criando o Grafico de Linha - Funcao Plot:

plot(carros, # indica os dados do grafico
     type = "o", # indica o tipo do marcador dos dados
     col = "blue", #indica a cor do grafico
     ylim = c(0,12)) #indica os limites do eixo y

lines(caminhoes, # adiciona uma nova linha no grafico com esses dados
      type = "o", #tipo de marcador do grafico
      pch = 22,
      lty = 2,
      col = "red") #cor do grafico

title(main = "Produção de Veículos", # inclui um titulo para o grafico com o texto indicado
      col.main = "red", #cor do texto
      font.main = 4) #tipo de fonte do texto

#Criando um Grafico de Caixa - Boxplot:
  
library(ggplot2)

View(mtcars)

# Criando o Boxplot:

ggplot(mtcars,
       aes(x = reorder(cyl,mpg), y = mpg, fill = cyl))+
  geom_boxplot()+
  xlab("cyl")+
  theme(legend.position = "none")

# Criando Grafico de Dispersao - Scatter Plot:

library(ggplot2)

# Criar os dados:

data = data.frame(cond=rep(c("condition_1", "condition_2"), each=10),
                  my_x = 1:100 + rnorm(100,sd=9),
                  my_y = 1:100 + rnorm(100,sd=16))
View(data)

# Criando o Grafico de Dispersao:

ggplot(data, #atribui o dataset
       aes(x = my_x, y = my_y))+ #atribui as variaveis nos eixos
  geom_point(shape=1) # cria o grafico de dispersao

# Adicionar uma Reta de Regressao:

ggplot(data, #atribui o dataset
       aes(x = my_x, y = my_y))+ #atribui os dados nos eixos
  geom_point(shape = 1)+ #cria o grafico de dispersao
  geom_smooth(method = lm, # metodo - regressao linear
              color = "red", # cor do grafico
              se = FALSE) #standard error - erro padrao ignorado

# Adicionar um Intervalo de confiança:

ggplot(data, #atribui o dataset
       aes(x = my_x, y = my_y))+ #atribui os dados nos eixos
  geom_point(shape = 1)+ #cria o grafico de dispersao
  geom_smooth(method = lm, # metodo - regressao linear
              color = "red", # cor do grafico
              se = TRUE) #standard error - erro padrao considerado