
    
    

select
    data_id as unique_field,
    count(*) as n_records

from `workspace`.`default`.`dim_tempo`
where data_id is not null
group by data_id
having count(*) > 1


