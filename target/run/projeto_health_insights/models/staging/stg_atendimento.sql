create or replace view `workspace`.`default`.`stg_atendimento`
  
  
  as
    select
    id,
    paciente,
    data_atendimento,
    procedimento
from `workspace`.`raw`.`atendimento`
