select * from cap16."TB_FUNC" order by salario_hora
-- Ordena os dados da tabela pela coluna salario_hora, em ordem crescente - por padrão

select * from cap16."TB_FUNC" order by salario_hora desc
-- Com a instrução 'desc', ordena os dados pela coluna em ordem decrescente

select * from cap16."TB_FUNC" order by salario_hora desc, reg_procedencia desc
-- Podemos ordenar os registros por mais de uma coluna indicando-as separadas por virgula
-- Devemos indicar a ordem de ordenação (desc/asc) para cada coluna

--------------------------------------------------------------------
select min(salario_hora) from cap16."TB_FUNC"
-- Retorna o menor valor dos registros de uma coluna

select max(salario_hora) from cap16."TB_FUNC"
-- Retorna o maior valor dos registros de uma columa

select avg(salario_hora) from cap16."TB_FUNC"
-- Retorna o média dos registros de uma coluna

select count(salario_hora) from cap16."TB_FUNC"
-- Conta os registros de uma coluna

select sum(salario_hora) from cap16."TB_FUNC"
-- Retorna a soma dos valores dos registros de uma coluna

select sum(salario_hora), count(salario_hora), max(salario_hora) from cap16."TB_FUNC"
-- Podem ser solicitadas várias medidas em uma mesma instrução indicando suas funções

--------------------------------------------------------------

select distinct reg_procedencia
from cap16."TB_FUNC"
-- Retorna os valores distintos dos registros da coluna da tabela

select avg(salario_hora) -- Retorna a media dos valores da coluna salario_hora
from cap16."TB_FUNC" -- Indica a tabela onde estão os dados
group by reg_procedencia -- Agrupa a média de salario_hora pelos registro unicos de reg_procedencia

select reg_procedencia, round(avg(salario_hora)) -- Indica a coluna dos dados de agrupamento
from cap16."TB_FUNC"
group by reg_procedencia
-- round - arredonda os valores da média (avg)