setwd("C:/Users/BRUNO/Google Drive/Estudos/PowerBI/Capitulo12")

notas <- read.csv("Notas.csv", fileEncoding = "windows-1252")

# Resumo Estatistico
summary(notas)
str(notas)

# Media das Turmas
mean(notas$TurmaA)
mean(notas$TurmaB)

# Variancia das Turmas
sd(notas$TurmaA)
sd(notas$TurmaB)
# A maior variabilidade foi da TurmaA, pois apresentou maior Desvio Padrão.


# Coeficientes de Variacao

sdA <- sd(notas$TurmaA)
meanA <- mean(notas$TurmaA)
cvA <- sdA / meanA * 100
print(cvA)

sdB <- sd(notas$TurmaB)
meanB <- mean(notas$TurmaB)
cvB <- sdB / meanB * 100
print(cvB)

# Verificar qual nota aparece mais vezes em cada Turma - Moda:

moda <- function(v) {
  valor_unico <- unique(v)
  valor_unico[which.max(tabulate(match(v, valor_unico)))]
}


modaA <- moda(notas$TurmaA)
modaB <- moda(notas$TurmaB)

print(modaA)
print(modaB)


