select
    id,
    paciente,
    data_atendimento,
    procedimento
from {{ source('raw','doenca') }}
