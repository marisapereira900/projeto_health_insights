create or replace view `workspace`.`default`.`stg_localidade`
  
  
  as
    select
    id,
    paciente,
    data_atendimento,
    procedimento
from `workspace`.`raw`.`localidade`
