select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sexo
from `workspace`.`default`.`fato_nascimento`
where sexo is null



      
    ) dbt_internal_test