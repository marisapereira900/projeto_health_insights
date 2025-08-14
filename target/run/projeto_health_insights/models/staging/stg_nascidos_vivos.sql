create or replace view `workspace`.`default`.`stg_nascidos_vivos`
  
  
  as
    

WITH nascidos_vivos_raw AS (
    SELECT
        CODMUNNASC,
        LOCNASC,
        DTNASC,
        HORANASC,
        SEXO,
        PESO,
        IDADEMAE,
        GESTACAO,
        PARTO,
        APGAR1,
        APGAR5,
        CODUFNATU
    FROM default.sinasc_2022_sc_clean
    WHERE CODUFNATU = 42 -- SC
),

with_row_number AS (
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY DTNASC, HORANASC, CODMUNNASC, LOCNASC, PESO, SEXO, IDADEMAE, GESTACAO, PARTO, APGAR1, APGAR5
            ORDER BY DTNASC, HORANASC
        ) as rn
    FROM nascidos_vivos_raw
)

SELECT
    md5(cast(concat(coalesce(cast(DTNASC as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(HORANASC as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(CODMUNNASC as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(LOCNASC as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(PESO as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(SEXO as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(IDADEMAE as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(GESTACAO as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(PARTO as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(APGAR1 as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(APGAR5 as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(rn as string), '_dbt_utils_surrogate_key_null_')) as string)) AS nascimento_id,
    CODMUNNASC AS cod_municipio,
    LOCNASC AS local_nascimento,
    DATE_FROM_UNIX_DATE(DTNASC) AS data_nascimento,
    HORANASC AS hora_nascimento,
    CASE
        WHEN SEXO = 1 THEN 'Masculino'
        WHEN SEXO = 2 THEN 'Feminino'
        ELSE 'Ignorado'
    END AS sexo,
    PESO AS peso,
    IDADEMAE AS idade_mae,
    GESTACAO AS gestacao_semanas,
    PARTO AS tipo_parto,
    APGAR1,
    APGAR5
FROM with_row_number
