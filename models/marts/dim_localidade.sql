{{ config(
    materialized='view'
) }}

SELECT
    cod_municipio,
    ANY_VALUE(local_nascimento) AS municipio -- Pega qualquer valor de local_nascimento
FROM {{ ref('int_nascimento') }}
GROUP BY cod_municipio