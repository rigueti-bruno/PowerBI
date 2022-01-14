select * from cap16."TB_FUNC"

select round(avg(idade)), numero_filhos, grau_instrucao -- seleciona os dados que serão apresentados
from cap16."TB_FUNC" -- Indica a tabela onde estão os dados
where salario_hora > (select avg(salario_hora) from cap16."TB_FUNC") -- Funcionarios com salario acima da media
and reg_procedencia = 'capital' -- Funcionarios da Capital
and estado_civil = 'casado' -- Funcionarios Casados
group by numero_filhos, grau_instrucao -- Agrupa pelo numero de fiilhos e grau de instrução
order by avg(idade) desc -- ordena pela media de idade em ordem decrescente

-- A query para esse exercício está correta.
