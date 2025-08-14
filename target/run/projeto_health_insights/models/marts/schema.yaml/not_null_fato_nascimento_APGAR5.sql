select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select APGAR5
from `workspace`.`default`.`fato_nascimento`
where APGAR5 is null



      
    ) dbt_internal_test