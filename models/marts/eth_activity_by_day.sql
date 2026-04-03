{{ config(tags=['daily']) }}

select date,
       transaction_category,
       count(*) as tx_count,
       {{ eth_decimals('value') }} as total_eth_value

  from {{ref('transactions_enriched')}}
 group by date, transaction_category

 {{ log('blah', info = True) }}