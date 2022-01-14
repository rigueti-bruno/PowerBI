select * from cap16."TB_FUNC"

select * from cap16."TB_FUNC" where idade < 30 --registros com idade < 30 anos

select * from cap16."TB_FUNC"
where idade < 30 and estado_civil = 'casado' -- "and" - operador "e", que adiciona condições
-- Para esse operador, todas as condições deverão ser verdadeiras para retornar os registros

select * from cap16."TB_FUNC"
where idade < 30 or estado_civil = 'viuvo' -- "or" - operador "ou", que adiciona condições
-- Para esse operador, pelo menos uma das condições deverá ser verdadeira para retornar registros

