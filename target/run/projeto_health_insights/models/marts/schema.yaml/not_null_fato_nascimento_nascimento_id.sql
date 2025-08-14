select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select nascimento_id
from `workspace`.`default`.`fato_nascimento`
where nascimento_id is null



      
    ) dbt_internal_test