select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select idade_mae
from `workspace`.`default`.`fato_nascimento`
where idade_mae is null



      
    ) dbt_internal_test