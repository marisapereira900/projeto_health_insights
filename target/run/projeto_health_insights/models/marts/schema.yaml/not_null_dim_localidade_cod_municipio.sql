select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select cod_municipio
from `workspace`.`default`.`dim_localidade`
where cod_municipio is null



      
    ) dbt_internal_test