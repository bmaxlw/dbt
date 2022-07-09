with gbp as(
    select * 
    from {{ source('exchange_rates', 'samples') }}
    where currency = 'GBP'
),
final as(
    select * from gbp
)
select * from final