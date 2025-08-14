select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select municipio
from `workspace`.`default`.`dim_localidade`
where municipio is null



      
    ) dbt_internal_test