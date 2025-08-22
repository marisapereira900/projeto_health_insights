-- Este script SQL calcula o total de nascimentos com baixo peso por município e a taxa percentual de nascimentos de baixo peso.
-- WITH: Cria uma tabela temporária (CTE) para organizar a lógica.

WITH nascimentos_municipio AS (
    SELECT
        l.municipio,
        COUNT(f.nascimento_id) AS total_nascimentos,
        SUM(CASE WHEN f.peso < 2500 THEN 1 ELSE 0 END) AS total_baixo_peso
    FROM
        fato_nascimento AS f
    JOIN
        dim_localidade AS l
    ON
        f.cod_municipio = l.cod_municipio
    GROUP BY
        l.municipio
)

-- SELECT final: Retorna os resultados e calcula a taxa percentual.
SELECT
    municipio,
    total_nascimentos,
    total_baixo_peso,
    (total_baixo_peso * 100.0 / total_nascimentos) AS taxa_baixo_peso_percentual
FROM
    nascimentos_municipio
WHERE
    total_nascimentos > 100 -- Filtra para municípios com mais de 100 nascimentos para garantir dados significativos.
ORDER BY

    taxa_baixo_peso_percentual DESC;
