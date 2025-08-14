select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select peso
from `workspace`.`default`.`fato_nascimento`
where peso is null



      
    ) dbt_internal_test