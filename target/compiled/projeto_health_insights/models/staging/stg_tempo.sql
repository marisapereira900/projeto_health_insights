

SELECT DISTINCT
    data_nascimento AS data,
    CAST(date_format(data_nascimento, 'yyyyMMdd') AS INT) AS data_id,
    year(data_nascimento) AS ano,
    month(data_nascimento) AS mes,
    day(data_nascimento) AS dia,
    quarter(data_nascimento) AS trimestre,
    dayofweek(data_nascimento) AS dia_semana
FROM `workspace`.`default`.`stg_nascidos_vivos`