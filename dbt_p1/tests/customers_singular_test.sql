-- return null values from
-- customer_id and customer_full_name 
-- which are initially meant to be not nulls

select customer_id, customer_full_name 
from {{ ref('customer_data') }}
where customer_id is null or customer_full_name is null
