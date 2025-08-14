select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        sexo as value_field,
        count(*) as n_records

    from `workspace`.`default`.`fato_nascimento`
    group by sexo

)

select *
from all_values
where value_field not in (
    'Masculino','Feminino','Ignorado'
)



      
    ) dbt_internal_test