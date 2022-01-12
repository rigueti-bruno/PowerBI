setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

dados <- read.table ("Usuarios.csv",
                     dec = ".",
                     sep = ",",
                     h = T,
                     fileEncoding = "windows-1252")

# Tabela de Frequencias Absolutas:

freq <- table(dados$grau_instrucao)
View(freq)

# Tabela de Frequencias Relativas:

freq_rel <- prop.table(freq)
View(freq_rel)

# Tabela de Frequencias Relativas em Percentual:

p_freq_rel <- 100 * prop.table(freq_rel)
View(p_freq_rel)

# Incluir o Total da Coluna das Frequencias na Tabela de Frequencias:

freq <- c(freq, sum(freq)) #Frequencias Absolutas
names(freq)[4] = "Total" #Linha 4 - Frequencias Absolutas
View(freq)

freq_rel <- c(freq_rel, sum(freq_rel)) #Frequencias Relativas

p_freq_rel <- c(p_freq_rel, sum(p_freq_rel)) #Frequencias Percentuais

# Combinacao das 3 Tabelas de Frequencia - Absoluta, Relativa e Percentual:

tabela_final<- cbind(freq, 
                      freq_rel = round(freq_rel, digits = 2), 
                      p_freq_rel = round(p_freq_rel, digits = 2))


View(tabela_final)
install.packages("httpgd")