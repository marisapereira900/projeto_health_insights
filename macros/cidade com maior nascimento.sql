SELECT
    cod_municipio,
    COUNT(nascimento_id) AS total_nascimentos
FROM
    fato_nascimento
GROUP BY
    cod_municipio
ORDER BY
    total_nascimentos DESC;
