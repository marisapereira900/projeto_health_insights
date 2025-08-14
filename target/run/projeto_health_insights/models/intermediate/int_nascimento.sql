create or replace view `workspace`.`default`.`int_nascimento`
  
  
  as
    

WITH base AS (
    SELECT *
    FROM `workspace`.`default`.`stg_nascidos_vivos`
)

SELECT
    nascimento_id,
    cod_municipio,
    local_nascimento,
    data_nascimento,
    hora_nascimento,
    sexo,
    peso,
    idade_mae,
    gestacao_semanas,
    tipo_parto,
    APGAR1,
    APGAR5
FROM base
