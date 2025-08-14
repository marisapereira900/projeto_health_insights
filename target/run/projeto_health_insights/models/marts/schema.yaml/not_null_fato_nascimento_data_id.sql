select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select data_id
from `workspace`.`default`.`fato_nascimento`
where data_id is null



      
    ) dbt_internal_test