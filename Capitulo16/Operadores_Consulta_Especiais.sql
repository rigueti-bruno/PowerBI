select * from cap16."TB_FUNC" where idade >=30 and idade <= 35 --Retorna registros entre 30 e 35 anos

select * from cap16."TB_FUNC" where idade between 30 and 35
-- Retorna os registros onde a variavel esta dentro de um intervalo de valores

select * from cap16."TB_FUNC"

select * from cap16."TB_FUNC" where grau_instrucao like '%medio'
-- Retorna os registros onde a palavra medio faça parte do valor da variavel grau_instrucao
-- Pode haver alguma outra palavra antes da palavra medio no valor da variavel

select * from cap16."TB_FUNC" where idade in (20,30,40,50)
-- Consulta os valores de uma variavel dentro de um conjunto de valores
-- O operador IN permite executar diversas regras com apenas 1 instrução
-- Pode ser usado para buscar valores numericos ou strings

select * from cap16."TB_FUNC" where numero_filhos is null
-- Verifica se há valores nulos nos registros da variável indicada

select * from cap16."TB_FUNC" where numero_filhos is not null
-- Retorna os registros onde os valores não são nulos na variável indicada
-- O operador NOT indicada negação, retornará verdadeiro para os valores opostos ao indicado

