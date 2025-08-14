-- Modelo intermediário de atendimento
select
    a.id as atendimento_id,
    a.paciente,
    a.data_atendimento,
    a.procedimento,
    d.id as doenca_id,
    l.id as localidade_id
from {{ ref('stg_atendimento') }} a
left join {{ ref('stg_doenca') }} d
    on a.paciente = d.paciente
left join {{ ref('stg_localidade') }} l
    on a.paciente = l.paciente
