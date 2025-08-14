

SELECT
    i.nascimento_id,
    t.data_id,
    l.cod_municipio,
    i.sexo,
    COALESCE(i.peso, 0) AS peso,
    i.idade_mae,
    COALESCE(i.gestacao_semanas, 0) AS gestacao_semanas,
    COALESCE(i.tipo_parto, 0) AS tipo_parto,
    COALESCE(i.APGAR1, 0) AS APGAR1,
    COALESCE(i.APGAR5, 0) AS APGAR5
FROM `workspace`.`default`.`int_nascimento` AS i
LEFT JOIN `workspace`.`default`.`dim_tempo` AS t
    ON i.data_nascimento = t.data
LEFT JOIN `workspace`.`default`.`dim_localidade` AS l
    ON i.cod_municipio = l.cod_municipio