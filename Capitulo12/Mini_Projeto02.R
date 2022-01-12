setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12") # carrega o diretorio

install.packages("dplyr")
install.packages("data.table")

# Carregar bibliotecas:

library(dplyr)
library(data.table)
library(ggplot2)
install.packages("extrafont")

# Carregar dados:

dados_iris <- iris
View(dados_iris)

# Sumarizando as Medias das Colunas do Dataset:

library(dplyr) # carregar a biblioteca dplyr

medias_iris <- summarize(group_by(dados_iris, Species), # Agrupa os dados pela Coluna Species
                         media_sepal_length = mean(Sepal.Length), #calcula as medias de cada coluna numerica
                         media_sepal_width = mean(Sepal.Width),
                         media_petal_length = mean(Petal.Length),
                         media_petal_width = mean(Petal.Width))

View(medias_iris)

# Extrair a Parte Inteira de Numeros Decimais em uma Coluna:

library(data.table) #aciona a biblioteca data.table

dados_iris_id <- data.table(dados_iris) # converte o dataset para o formato data.table e atribui a uma nova variavel

dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)
#converte os valores decimais em inteiros, excluindo as partes decimais e atribuindo a mesma coluna
#a linguagem R nao arredonda os numeros, apenas exclui a parte decimal

View(dados_iris_id)

# Criar um Grafico de 2 Colunas Numericas categorizadas pela Coluna Categorica:

library(ggplot2) #acionar a biblioteca ggplot2
library(extrafont)

# Grafico de Dispersão

ggplot(data = dados_iris, #atribui os dados ao grafico
       aes(x = Petal.Width, #atribui a variavel ao eixo x
           y = Petal.Length))+ #atribui a variavel ao eixo y
  geom_point(aes(color = Species), #atribui as categorias
                 size = 3)+ #atribui o tamanho das categorias
  ggtitle("Largura e Comprimeto das Petalas")+ #atribui um titulo ao grafico
  labs(x = "Largura da Petala", #atribui titulos nos eixos do grafico
       y = "Comprimento da Petala")+
  theme_bw()+ #atribui o tema bw ao grafico
  theme(title = element_text(size = 15, #atribui o tamanho 15 a fonte do titulo
                             color = "turquoise4", hjust = 0.5)) #atribui cor a fonte do titulo

#Grafico de Regressao Linear

ggplot(data = dados_iris, #atribui os dados ao grafico
       aes(x = Petal.Width, #atribui a variavel ao eixo x
           y = Petal.Length))+ #atribui a variavel ao eixo y
  geom_smooth(method = lm,
              aes(color = Species), #atribui as categorias 
             se = FALSE)+ #atribui o tamanho das categorias
  ggtitle("Largura e Comprimeto das Petalas - Relação Linear")+ #atribui um titulo ao grafico
  labs(x = "Largura da Petala", #atribui titulos nos eixos do grafico
       y = "Comprimento da Petala")+
  theme_bw()+ #atribui o tema bw ao grafico
  theme(title = element_text(size = 15, #atribui o tamanho 15 a fonte do titulo
                             color = "turquoise4", hjust = 0.5)) #atribui cor a fonte do titulo

# Grafico de Barras

m <- count(dados_iris, Species)

ggplot(data = dados_iris,
       aes(x = as.factor(Species),
           fill = Species))+
  geom_bar(width = 0.65,
           color = "black")+
  ggtitle("Observações por Espécie")+
  labs(x = "Número de Observações", y = "Espécies Observadas")+
  geom_text(data = m, aes(y = n, label = n, vjust = -0.3))+
  theme(text = element_text(size = 15, color = "turquoise4", hjust = 0.5))
  

# Gráfico de Linha

ggplot(data = dados_iris, #atribui os dados ao grafico
       aes(x = Petal.Length, #atribui a variavel ao eixo x
           y = Sepal.Length))+ #atribui a variavel ao eixo y
  geom_smooth(method = loess,
              color = "green", #atribui as categorias 
              se = TRUE)+ #atribui o tamanho das categorias
  ggtitle("Relação entre os Tamanhos das Pétalas e Sépalas")+ #atribui um titulo ao grafico
  labs(x = "Comprimento da Pétala", #atribui titulos nos eixos do grafico
       y = "Comprimento da Sépala")+
  theme_bw()+ #atribui o tema bw ao grafico
  theme(text = element_text(size = 15, #atribui o tamanho 15 a fonte do titulo
                             color = "turquoise4", hjust = 0.5, family = "Calibri"))
View(dados_iris)

s <- max(dados_iris$Sepal.Length)
p <- max(dados_iris$Petal.Length)

?element_text

fonts()
