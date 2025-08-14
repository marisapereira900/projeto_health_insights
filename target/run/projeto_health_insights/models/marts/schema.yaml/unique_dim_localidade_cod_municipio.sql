select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    cod_municipio as unique_field,
    count(*) as n_records

from `workspace`.`default`.`dim_localidade`
where cod_municipio is not null
group by cod_municipio
having count(*) > 1



      
    ) dbt_internal_test