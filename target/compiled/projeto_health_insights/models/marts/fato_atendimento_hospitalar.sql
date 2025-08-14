-- Fato Atendimento Hospitalar
select
    a.paciente,
    a.data_atendimento,
    a.procedimento,
    a.doenca_id,
    a.localidade_id
from `workspace`.`default`.`int_atendimento` a