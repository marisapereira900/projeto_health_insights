select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    data_id as unique_field,
    count(*) as n_records

from `workspace`.`default`.`dim_tempo`
where data_id is not null
group by data_id
having count(*) > 1



      
    ) dbt_internal_test