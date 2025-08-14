select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    nascimento_id as unique_field,
    count(*) as n_records

from `workspace`.`default`.`fato_nascimento`
where nascimento_id is not null
group by nascimento_id
having count(*) > 1



      
    ) dbt_internal_test