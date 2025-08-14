

WITH datas AS (
    SELECT DISTINCT
        data_nascimento AS data
    FROM `workspace`.`default`.`int_nascimento`
)

SELECT
    ROW_NUMBER() OVER (ORDER BY data) AS data_id,
    data,
    EXTRACT(YEAR FROM data) AS ano,
    EXTRACT(MONTH FROM data) AS mes,
    EXTRACT(DAY FROM data) AS dia,
    DAYOFWEEK(data) AS dia_semana
FROM datas