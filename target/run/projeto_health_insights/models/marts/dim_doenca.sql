create or replace view `workspace`.`default`.`dim_doenca`
  
  
  as
    -- Dimensão Doença
select
    id as doenca_id,
    paciente,
    data_atendimento,
    procedimento as descricao_doenca
from `workspace`.`default`.`stg_doenca`
