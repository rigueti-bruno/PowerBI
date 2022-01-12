setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

# Criando os Dados:

vetor_total_resultados = c(3,12,5,18,45) # Vetor com os Valores

names(vetor_total_resultados) = c("A","B","C","D","E") # Vetor com os Rótulos

View(vetor_total_resultados)

# Grafico de Barras - barplot:

barplot(vetor_total_resultados, col = c(1,2,3,4,5)) # Cria o Gráfico de Barras

# Criando o gráfico e salvando em Arquivo:

png("barplot.png", width = 480, height = 480) # Cria o arquivo que receberá o gráfico

barplot(vetor_total_resultados, # chama o vetor
        col = rgb(0.5,0.1,0.6,0.6), # atribui cores rgb ao gráfico
        xlab = "Categorias", # atribui um rotulo ao eixo x
        ylab = "Valores", # atribui um rotulo ao eixo y
        main = "Barplot em R", # atribui um título ao gráfico
        ylim = c(0,60)) # atribui limites ao eixo y

dev.off() #salva o gráfico gerado no arquivo criado pela função png

# Graficos com ggplot2

# Grafico de Barras com o ggplot2:

library(ggplot2) # carrega o ggplot2

View(mtcars) # visualiza o dataset pre-carregado mtcars

# Criando o grafico de barras com o ggplot2:

ggplot(mtcars, #carrega o dataset
       aes(x = as.factor(cyl), #atribui os dados ao eixo x
           fill = as.factor(cyl)))+ #categoriza os dados
  geom_bar()+ #gera o grafico de barras
  scale_fill_manual(values = c("red","green","blue")) #atribui as cores ao grafico
  
# Criando dados ficticios:

dados = data.frame(group = c("A","B","C","D"), value = c(33,62,56,67))
View(dados)

# Criando o barplot com os dados criados:

ggplot(dados,
       aes(x = group,
           y = value,
           fill = group))+
  geom_bar(width = 0.85,
           stat = "identity")

# Criando Graficos de Pizza - Pie Chart:

fatias <- c(4,12,14,16,8) # cria os valores da fatia
paises <- c("Brasil","Estados Unidos","Alemanha","Reino Unido","Espanha")

# Pie Chart:

pie(fatias, #atribui os valores das fatias
    labels = paises, #atribui as categorias das fatias
    main = "Leitura de Livros por pessoa/ano") #atribui titulo ao grafico

# Criando Grafico de Pizza 3D:

# Instalar e carregar a biblioteca plotrix:

install.packages("plotrix") #instala a biblioteca

library(plotrix) #carrega a biblioteca

pie3D(fatias, #atribui os valores das fatias
      labels = paises, #atribui as categorias das fatias
      explode = 0.1, #atribui a separacao das fatias
      main = "Leitura de Livros por pessoa/ano") #atribui um titulo ao grafico