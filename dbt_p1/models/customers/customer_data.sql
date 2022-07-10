{{ config(materialized='table') }}

with customers_1990 as(
    select 
        c_customer_sk as customer_id,
        concat(
            case when c_salutation is null 
                then 'NaN' else c_salutation end, 
            ' ', 
            case when c_first_name is null 
                then 'NaN' else c_first_name end, 
            ' ', 
            case when c_last_name is null 
                then 'NaN' else c_last_name end) as customer_full_name,
        date_from_parts(c_birth_year, 
                        c_birth_month, 
                        c_birth_day) as customer_birth_date,
        datediff(YEAR, 
                date_from_parts(c_birth_year, c_birth_month, c_birth_day), 
                current_date()) as customer_age,
        c_birth_country as customer_birth_country,
        c_email_address as customer_email
    from {{source('customer_source', 'CUSTOMER')}}
    where c_birth_year >= 1990
),
final as(
    select * from customers_1990
)
select * from final