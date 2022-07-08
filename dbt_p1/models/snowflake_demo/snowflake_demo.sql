with snowflake_demo as(
    select * 
    from {{ source('snowflake_demo', 'store_sales') }}
)
select * from snowflake_demo
