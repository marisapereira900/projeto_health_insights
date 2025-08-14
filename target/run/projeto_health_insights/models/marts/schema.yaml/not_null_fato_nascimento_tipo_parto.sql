select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select tipo_parto
from `workspace`.`default`.`fato_nascimento`
where tipo_parto is null



      
    ) dbt_internal_test