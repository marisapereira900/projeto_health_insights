create or replace view `workspace`.`default`.`dim_localidade`
  
  
  as
    

SELECT
    cod_municipio,
    ANY_VALUE(local_nascimento) AS municipio -- Pega qualquer valor de local_nascimento
FROM `workspace`.`default`.`int_nascimento`
GROUP BY cod_municipio
