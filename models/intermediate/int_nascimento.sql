{{ config(
    materialized='view'
) }}

WITH base AS (
    SELECT *
    FROM {{ ref('stg_nascidos_vivos') }}
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
