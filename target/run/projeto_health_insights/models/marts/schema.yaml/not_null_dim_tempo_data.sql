select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select data
from `workspace`.`default`.`dim_tempo`
where data is null



      
    ) dbt_internal_test