with czk as(
    select * 
    from {{ source('exchange_rates', 'samples') }}
    where currency = 'CZK'
),
final as(
    select * from czk
)
select * from final