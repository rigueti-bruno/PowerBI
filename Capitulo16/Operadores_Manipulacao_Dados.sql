-- Instruções utilizadas para Manipular Dados - DML:

update cap16."TB_FUNC" -- atualiza os valores da tabela
set numero_filhos = null -- para valores nulos da variavel numero_filhos
where numero_filhos = 'NA'; -- onde o valor estiver igual a 'NA'
-- Essas instruções alteram para nulo os valores da variavel que estão como NA

commit; -- Grava as alterações feitas nos registros da tabela - executar após as alterações
------------------------------------------------
select * from cap16."TB_FUNC" where numero_filhos is null
-- Filtra os registros com valores nulos na variavel numero_filhos

------------------------------------------------
truncate cap16."TB_FUNC" -- Exclui todos os registros da Tabela

select * from cap16."TB_FUNC" -- Confere se os registros da tabela foram apagados após o Truncate

------------------------------------------------
delete from cap16."TB_FUNC" -- Instrução que exclui os registros
where numero_filhos = 'NA'; -- Indica o filtro de quais registros serão deletados

commit; -- grava a exclusão dos registros

------------------------------------------------
-- Instrução que insere registros na tabela:
INSERT INTO cap16."TB_FUNC"( -- Variaveis que serão preenchidas
	"ID", estado_civil, grau_instrucao, numero_filhos, salario_hora, idade, reg_procedencia) 
	VALUES (38, 'casado', 'ensino medio', 3, 4.50, 30, 'capital'); -- indica os valores que serão preenchidos

