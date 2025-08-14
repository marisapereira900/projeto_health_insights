create or replace view `workspace`.`default`.`stg_doenca`
  
  
  as
    select
    id,
    paciente,
    data_atendimento,
    procedimento
from `workspace`.`raw`.`doenca`
