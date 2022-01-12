# Prevendo inadimplência com Machine Learning e Power BI

# Definindo a Pasta de Trabalho:
setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo15")

# Instalando os Pacotes para o Projeto:

install.packages("Amelia") #trata valores ausentes
install.packages("caret") #permite construcao de modelos de ML e pre-processar os dados
install.packages("ggplot2") #construção de graficos
install.packages("dplyr") #manipulacao de dados 
install.packages("reshape") #modificacao do formato de dados
install.packages("randomForest") #desenvolvimento de machine learning
install.packages("e1071") #desenvolvimento de machine learning

# Carregando os Pacotes para o Projeto:

library(Amelia)
library(ggplot2) #carregar antes do caret
library(lattice) #carregar antes do caret
library(caret)
library(dplyr)
library(reshape)
library(randomForest)
library(e1071)

# Carregando os Dados para o Projeto:

dados_clientes <- read.csv("dados/dataset.csv")

# Visualizar os Dados Carregados:

View(dados_clientes) #visualiza a tabela com os dados

str(dados_clientes) #lista as variaveis e seus tipos de dados

summary(dados_clientes) #gera um resumo estatistico das variaveis do dataset

# Analise Exploratoria, Limpeza e Transformacao dos Dados:

# Removendo a Primeira Coluna ID - apenas identificador da linha, não deve ser
# levado para o modelo de Machine Learning:

dados_clientes$ID <- NULL #Exclui a coluna
dim(dados_clientes) #Confere as dimensoes do dataset

# Renomeando a Coluna de Classe - Variavel Target:

colnames(dados_clientes) #mostra os titulos das colunas da tabela

colnames(dados_clientes)[24] <- "inadimplente" #renomeia a coluna

colnames(dados_clientes) #confere se a coluna foi renomeada

View(dados_clientes) #visualiza a tabela toda

# Conferir se há valores ausentes na tabela:

sapply(dados_clientes, function(x) sum(is.na(x))) #retorna os valores ausentes de cada coluna

missmap(dados_clientes, main = "Valores Ausentes Observados") #apresenta graficamente os valores ausentes

# Convertendo Atributos para Fatores (Categorias):

str(dados_clientes) #lista os tipos de dados das variaveis

#Renomear as Variaveis:
colnames(dados_clientes)[2] <- "Genero" #Sex
colnames(dados_clientes)[3] <- "Escolaridade" #Education
colnames(dados_clientes)[4] <- "Estado_Civil" #Marriage
colnames(dados_clientes)[5] <- "Idade" #Age

colnames(dados_clientes) #Conferir as colunas das tabelas
View(dados_clientes) #Carrega a tabela completa

# Convertendo as Variaveis para Cetegoricas:

#Genero

dados_clientes$Genero <- cut(dados_clientes$Genero, #variavel a ser convertida
                             c(0,1,2), #valores atuais da variavel
                             labels = c("Masculino", "Feminino")) #novos valores para a variavel

str(dados_clientes$Genero) #confere o tipo de dados da variavel convertida

summary(dados_clientes$Genero) #gera um resumo estatistico do tipo atual da variavel

#Escolaridade

summary(dados_clientes$Escolaridade)
# O valor minimo foi 0 e o maximo 6, diferente dos dados informados pela documentacao
# Como esses valores nao estao nas categorias, se tornarao dados ausentes

dados_clientes$Escolaridade <- cut(dados_clientes$Escolaridade,
                                   c(0,1,2,3,4),
                                   labels = c("Pos Graduado",
                                              "Graduado",
                                              "Ensino Medio",
                                              "Outros"))

summary(dados_clientes$Escolaridade) #conferencias dos valores convertidos
#aparecera os dados ausentes

# Estado Civil

dados_clientes$Estado_Civil <- cut(dados_clientes$Estado_Civil,
                                   c(-1,0,1,2,3),
                                   labels = c("Desconhecido", #categoria dos nao identificados
                                              "Casado",
                                              "Solteiro",
                                              "Outro"))

summary(dados_clientes$Estado_Civil)

#Idade

#Criando Faixas Etarias:

dados_clientes$Idade <- cut(dados_clientes$Idade,
                            c(0,30,50,100), #limites superiores das faixas etarias
                            labels = c("Jovem",
                                       "Adulto",
                                       "Idoso"))

summary(dados_clientes$Idade)

# Conversao das Variaveis PAY_0 a PAY_6 para Categoricas:

dados_clientes$PAY_0 <- as.factor(dados_clientes$PAY_0)
dados_clientes$PAY_2 <- as.factor(dados_clientes$PAY_2)
dados_clientes$PAY_3 <- as.factor(dados_clientes$PAY_3)
dados_clientes$PAY_4 <- as.factor(dados_clientes$PAY_4)
dados_clientes$PAY_5 <- as.factor(dados_clientes$PAY_5)
dados_clientes$PAY_6 <- as.factor(dados_clientes$PAY_6)

summary(dados_clientes) #resumo estatistico com os dados convertidos

str(dados_clientes) #listagem das variaveis com os tipos convertidos

#Conferir registros ausentes gerados pelas conversoes no dataset:

sapply(dados_clientes, function(x) sum(is.na(x)))
#retornara os registros ausentes na variavel Escolaridade

dim(dados_clientes) #confere as dimensoes da varial atuais
#30000 - registros
#24 - colunas

#Omitir os Registros Ausentes:

dados_clientes <- na.omit(dados_clientes)

dim(dados_clientes) #confere as dismensoes do dataset apos a omissao dos dados ausentes
#29655 - registros
#24 - colunas

# Convertendo o Tipo de Dados para a Variavel Target - inadimplente:

dados_clientes$inadimplente <- as.factor(dados_clientes$inadimplente)

str(dados_clientes$inadimplente) #verificar a conversao dos dados para factor

# Conferir o Total de Inadimplentes versus o Total de Nao Inadimplentes:

table(dados_clientes$inadimplente) #sumariza as quantidades de cada valor
#0 - 23045
#1 - 6610

# Proporcao de Registros de Cada Valor da Variavel:

prop.table(table(dados_clientes$inadimplente)) #mostra as proporcoes dos valores

# Plot da distruibuicao usando o ggplot2:

qplot(inadimplente, #variavel a ser plotada
      data = dados_clientes, #dataset dos dados
      geom = "bar")+ #tipo do grafico
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1))

# Divisao de Dados de Treino e Dados de Teste #

set.seed(12345)

#Cria os indices de linha para filtrar o dataset original
indice <- createDataPartition(dados_clientes$inadimplente, #seleciona a variavel filtro/target
                              p = 0.75, #indica a proporcao de dados de treino
                              list = FALSE) #indica que o objeto indice sera uma matriz

#Definimos o conjunto de dados de treino filtrando o dataset original com o indice:

dados_treino <- dados_clientes[indice,]
#seleciona os registros indicados no indice em todas as colunas e atribui a um novo objeto

table(dados_treino$inadimplente)
#indica a proporcao de registros pelos valores da variavel inadimplente

prop.table(table(dados_treino$inadimplente))
#indica proporcao percentual entre os registros com os valores da variavel inadimplencia

dim(dados_treino) #indica as dimensoes da tabela dados treino
#22242 - registros (linhas)
#24 - colunas

#Comparacao entre dados_treino e dados_clientes (original):

#Cria um objeto para as comparacoes serem atribuidas
compara_dados <- cbind(prop.table(table(dados_treino$inadimplente)), #proporcoes - treino
                       prop.table(table(dados_clientes$inadimplente))) #proporcoes - original

colnames(compara_dados) <- c("Treinamento","Original") #atribui rotulos as colunas do objeto

compara_dados #imprime a tabela de comparacao

# Criando os Dados de Teste:

dados_teste <- dados_clientes[-indice,] # -indice: linhas que nao estao no indice
#realiza o filtro dos dados que nao foram atribuidos nos dados de treino
#atribui os dados filtrados a um novo objeto

dim(dados_teste)
#registros - 7413
dim(dados_treino)
#registros - 22242
dim(dados_clientes)
#registros - 29655


prop.table(table(dados_teste$inadimplente))

# Construindo o Modelo de Machine Learning #

# Construindo a primeira versao do modelo:

modelo_v1 <- randomForest(inadimplente ~ ., data = dados_treino)
# algoritmo randomForest
# inadimplente - variavel alvo - o que queremos prever
# . - todas as variaveis preditoras - variaveis de entrada
# data = dados_treino - dataset com os dados de treino

modelo_v1 #visualização os dados do modelo

# Avaliando a Primeira Versao do Modelo #

#Gerando um Grafico:

plot(modelo_v1)
# linha superior - performande do modelo
# linhas inferiores - erros do modelo

#Gerando Previsoes com o Modelo utilizando os Dados de Teste:

previsoes_v1 <- predict(modelo_v1, dados_teste)
# previsoes_v1 - objeto onde as previsoes serao armazenadas
# predict - funcao que gera as previsoes
# modelo_v1 - modelo de machine learning
# dados_treino - dados utilizados para gerar as previsoes

plot(previsoes_v1)

# Gerando a Matriz de Confusao (Confusion Matrix):

# Compara as Observacoes Reais com os Valores Previstos pelo Modelo

cm_v1 <- caret::confusionMatrix(previsoes_v1, dados_teste$inadimplente, positive = "1")

# cm_v1 - objeto onde sera armazenada a matriz de confisao
# previsoes_v1 - previsoes geradas pelo modelo
# dados_treino$inadimplente - observacoes reais nos dados de treino
# positive = "1" - valor da classe alvo (inadimplentes)

cm_v1 #visualiza os dados da matriz de confusao

# Metricas de Avaliacao do Modelo: Precision, Recall, F1-score:

y <- dados_teste$inadimplente #observacoes reais

y_pred_v1 <- previsoes_v1 #valores previstos

precision_v1 <- posPredValue(y_pred_v1, y) #calcula a precisao do modelo

recall_v1 <- sensitivity(y_pred_v1, y) #calcula o recall do modelo

F1_v1 <- (2 * precision_v1 * recall_v1) / (precision_v1 + recall_v1) #calcula o F1-score

# Balanceamento da Classe dos Inadimplentes - SMOTE - Over-sampling:

remotes::install_github("cran/DMwR")
library(DMwR) #Carrega a biblioteca DMwR

set.seed(9560) #permite que o processo randomico seja reproduzido

dados_treino_bal <- SMOTE(inadimplente ~ ., data = dados_treino)
# SMOTE() - funcao que faz a reamostragem over-sampling dos dados de treino
# inadimplente - variavel target
# . - seleciona todas as veriaveis preditoras
# data = dados_treino - indica o dataset com os dados de treino
# dados_treino_bal - armazena os dados balanceados

table(dados_treino_bal$inadimplente) #verifica as novas proporcoes das categorias

prop.table(table(dados_treino_bal$inadimplente)) #verifica as proporcoes em percentual
# 0 - 0.5714
# 1 - 0.4286

# Construcao da Segunda Versao do Modelo de Machine Learning:

modelo_v2 <- randomForest(inadimplente ~ ., data = dados_treino_bal)
# Novo Modelo criado utilizando os Dados de Treino Balanceados

# Avaliando a Segunda Versao do Modelo: #

# Grafico do Modelo:

plot(modelo_v2)

# Previsoes do Modelo:

previsoes_v2 <- predict(modelo_v2, dados_teste)
plot(previsoes_v2)

# Matriz de Confusao do Modelo:

cm_v2 <- caret::confusionMatrix(previsoes_v2, dados_teste$inadimplente, positive = "1")

cm_v2 #visualizar a Matriz de Confucao e suas Estatisticas

y <- dados_teste$inadimplente
y_pred_v2 <- previsoes_v2

precision_v2 <- posPredValue(y_pred_v2, y)
precision_v2

recall_v2 <- sensitivity(y_pred_v2, y)
recall_v2

F1_v2 <- (2 * precision_v2 * recall_v2) / (precision_v2 + recall_v2)
F1_v2

# Cria Tabela Comparando os Indicadores das Versoes do Modelo:

# Variacoes dos indicadores:
var_precision <- (precision_v2 / precision_v1) - 1
var_recall <- (recall_v2 / recall_v1) - 1
var_F1 <- (F1_v2 / F1_v1) - 1

compara_modelos <- cbind(c(precision_v1, recall_v1, F1_v1), 
                         c(precision_v2, recall_v2, F1_v2),
                         c(var_precision, var_recall, var_F1))
colnames(compara_modelos) <- c("Modelo v1","Modelo v2", "Variacoes")
rownames(compara_modelos) <- c("Precision", "Recall", "F1-score")

compara_modelos #Imprime a Tabela com os indicadores dos Modelos


# Verificar a Importancia das Variaveis para o Modelo: #

# Plotando um grafico com a Importancia das Variaveis no Modelo:

varImpPlot(modelo_v2)
# mais para direita - mais importante
# mais para esquerda - menos importante

# Obtendo a Importancia das Variaveis:

imp_var <- importance(modelo_v2)
varImportance <- data.frame(Variables = row.names(imp_var),
                            Importance = round(imp_var[,"MeanDecreaseGini"],2))

# Criando um Ranking das Variaveis por suas importancias:

rankImportance <- varImportance %>%
  mutate(Rank = paste0('#', dense_rank(desc(Importance))))

# Usando o ggplot2 para visualizar a importancia relativa das variáveis do modelo:

ggplot(rankImportance,
       aes(x = reorder(Variables, Importance),
           y = Importance,
           fill = Importance))+
  geom_bar(stat = 'identity')+
  geom_text(aes(x = Variables, y = 0.5, label = Rank),
            hjust = 0,
            vjust = 0.55,
            size = 4,
            colour = 'red')+
  labs(x = 'Variables')+
  coord_flip()
  
# Construindo a Terceira Versao do Modelo de Machine Learning: #

colnames(dados_treino_bal)

modelo_v3 <- randomForest(inadimplente ~ PAY_0 + PAY_2 + PAY_3 + PAY_AMT1 + PAY_AMT2 + PAY_5 + BILL_AMT1,
                          data = dados_treino_bal)

modelo_v3

# Avaliando a Terceira Versao do Modelo de Machine Learning: #

plot(modelo_v3) #gráfico da performance do modelo

# Previsoes com os dados de teste:

previsoes_v3 <- predict(modelo_v3, dados_teste)

# Matriz de Confusao:

cm_v3 <- caret::confusionMatrix(previsoes_v3,
                                dados_teste$inadimplente,
                                positive = "1")

# Calculo da Precision, Recall e F1-score:

y <- dados_teste$inadimplente
y_pred_v3 <- previsoes_v3

precision_v3 <- posPredValue(y_pred_v3, y)

recall_v3 <- sensitivity(y_pred_v3, y)

F1_v3 <- (2 * precision_v3 * recall_v3) / (precision_v3 + recall_v3)

# Visualizando as Metricas:

cm_v3 #Matriz de Confusao

precision_v3 #Precision

recall_v3 #Recall

F1_v3 #F1-score

# Tabela de Comparacao dos Modelos: #

tab_comparacao <- cbind(c(precision_v1, precision_v2, precision_v3),
                        c(recall_v1, recall_v2, recall_v3),
                        c(F1_v1, F1_v2, F1_v3))
colnames(tab_comparacao) <- c("Modelo_v1", "Modelo_v2", "Modelo_v3")
rownames(tab_comparacao) <- c("Precision", "Recall", "F1-score")

tab_comparacao

# Matrizes de Confusao:

cm_v1
#Accuracy - 0.8175
#0-0 - 5453
#0-1 - 308
#1-0 - 1045
#1-1 - 607

cm_v2
#Accuracy - 0.7946
#0-0 - 5049
#0-1 - 712
#1-0 - 811
#1-1 - 841

cm_v3
#Accuracy - 0.7952
#0-0 - 5191
#0-1 - 570
#1-0 - 948
#1-1 - 704

# Salvar o Modelo Treinado em Disco: #

# Salvando o Modelo em disco:

saveRDS(modelo_v3, file = "modelo/modelo_v3.rds")

# Fazer Previsoes com o Modelo Salvo: #

# Carregando o Modelo do Disco:

modelo_final <- readRDS("modelo/modelo_v3.rds")

# Informando dados novos de 3 clientes:

PAY_0 <- c(0,0,0)
PAY_2 <- c(0,0,0)
PAY_3 <- c(1,0,0)
PAY_AMT1 <- c(1100,1000,1200)
PAY_AMT2 <- c(1500,1300,1150)
PAY_5 <- c(0,0,0)
BILL_AMT1 <- c(350,420,280)

# Concatenando os dados novos em um dataframe:

novos_clientes <- data.frame(PAY_0, PAY_2, PAY_3, PAY_AMT1, PAY_AMT2, PAY_5, BILL_AMT1)

# Conferindo os tipos de dados:

str(dados_treino_bal)
str(novos_clientes)

# Convertendo os Tipos de Dados:

novos_clientes$PAY_0 <- factor(novos_clientes$PAY_0, levels = levels(dados_treino_bal$PAY_0))
novos_clientes$PAY_2 <- factor(novos_clientes$PAY_2, levels = levels(dados_treino_bal$PAY_2))
novos_clientes$PAY_3 <- factor(novos_clientes$PAY_3, levels = levels(dados_treino_bal$PAY_3))
novos_clientes$PAY_5 <- factor(novos_clientes$PAY_5, levels = levels(dados_treino_bal$PAY_5))
str(novos_clientes)
# Realizando as Previsoes:

previsoes_novo_cliente <- predict(modelo_final, novos_clientes)


previsoes_novo_cliente <- data.frame(previsoes_novo_cliente)


View(previsoes_novo_cliente)