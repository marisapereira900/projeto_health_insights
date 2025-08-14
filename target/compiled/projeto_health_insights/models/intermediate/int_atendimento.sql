-- Modelo intermediário de atendimento
select
    a.id as atendimento_id,
    a.paciente,
    a.data_atendimento,
    a.procedimento,
    d.id as doenca_id,
    l.id as localidade_id
from `workspace`.`default`.`stg_atendimento` a
left join `workspace`.`default`.`stg_doenca` d
    on a.paciente = d.paciente
left join `workspace`.`default`.`stg_localidade` l
    on a.paciente = l.paciente