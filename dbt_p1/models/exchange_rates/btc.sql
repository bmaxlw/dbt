with btc as(
    select * 
    from {{ source('exchange_rates', 'samples') }}
    where currency = 'BTC'
),
final as(
    select * from btc
)
select * from final
