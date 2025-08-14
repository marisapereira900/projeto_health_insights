-- Dimensão Doença
select
    id as doenca_id,
    paciente,
    data_atendimento,
    procedimento as descricao_doenca
from {{ ref('stg_doenca') }}
