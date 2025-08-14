select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select local_nascimento
from `workspace`.`default`.`dim_localidade`
where local_nascimento is null



      
    ) dbt_internal_test