select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select gestacao_semanas
from `workspace`.`default`.`fato_nascimento`
where gestacao_semanas is null



      
    ) dbt_internal_test