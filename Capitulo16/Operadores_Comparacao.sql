select * from cap16."TB_FUNC" --Mostra todos os registros da tabela

select count(*) from cap16."TB_FUNC" --Conta todos os registros da tabela

select count(*) from cap16."TB_FUNC" where idade = 40 -- = - operador de igualdade

select count(*) from cap16."TB_FUNC" where idade != 40 -- != - operador de desigualdade

select count(*) from cap16."TB_FUNC" where idade > 40 -- > - operador "maior que"

select count(*) from cap16."TB_FUNC" where idade >= 40 -- >= - operador "maior ou igual a"

select count(*) from cap16."TB_FUNC" where idade < 40 -- < - operador "menor que"

select count(*) from cap16."TB_FUNC" where idade <= 40 -- <= - operador "menor ou igual a"