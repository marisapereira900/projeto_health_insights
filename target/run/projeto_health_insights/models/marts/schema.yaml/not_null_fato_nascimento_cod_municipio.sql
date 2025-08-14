select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select cod_municipio
from `workspace`.`default`.`fato_nascimento`
where cod_municipio is null



      
    ) dbt_internal_test