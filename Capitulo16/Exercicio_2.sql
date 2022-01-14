
-- Solução 1:
select *
from cap16."TB_FUNC"
where numero_filhos = '2'

-- Solução 2 - Cast:
select *
from cap16."TB_FUNC"
where cast(numero_filhos as integer) = 2

