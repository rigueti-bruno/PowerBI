select * from cap16."TB_ENDERECO"

-- Solução 1 - minha - relaciona todos os dados das duas colunas:
select round(avg(salario_hora)), estado -- Indica as variáveis que serão retornadas
from cap16."TB_FUNC" -- Seleciona a primeira tabela - origem "salario_hora"
full outer join cap16."TB_ENDERECO" -- Seleciona a segunda tabela - origem "estado"
on "ID" = id_func -- Indica os campos relacionados nas duas tabelas - 
group by estado -- Indica o agrupamento para a agregação avg()

-- full outer join - puxa as variáveis que não se repetem nas tabelas

-- Solução 2 - professor - relaciona somente os dados que possuem relacionamento:
select round(avg(salario_hora)), estado -- Indica as variáveis que serão retornadas
from cap16."TB_FUNC" f, cap16."TB_ENDERECO" e -- Indica as tabelas
where f."ID" = e.id_func -- Indica os campos relacionados nas duas tabelas - 
group by estado -- Indica o agrupamento para a agregação avg()