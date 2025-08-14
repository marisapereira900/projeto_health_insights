select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ano
from `workspace`.`default`.`dim_tempo`
where ano is null



      
    ) dbt_internal_test