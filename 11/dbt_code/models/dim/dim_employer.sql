WITH src_employer as (select * from {{ ref('src_employer') }})

select 

    {{ dbt_utils.generate_surrogate_key(['id', 'employer_name']) }} AS employer_id,
    employer_name,

    {{ capitalize_first_letter("coalesce(workplace_city, 'stad ej specificerad')") }} AS workplace_city

 from src_employer

