select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select dia
from `workspace`.`default`.`dim_tempo`
where dia is null



      
    ) dbt_internal_test