select t.date,
       t.token_address,
       s.type,
       s.symbol,
       sum({{decimals('t.value', 's.decimals')}}) as total_usd_value
  from {{ ref('stg_token_transfers')}} as t inner join {{ ref('stablecoins')}} s on lower(t.token_address) = lower(s.contract_address)

group by t.date, 
         t.token_address, 
         s.type,
         s.symbol