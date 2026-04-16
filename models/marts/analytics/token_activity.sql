{{ config(tags = ['token'], alias = var('token_name_var')) }}

select t.date,
       t.token_address,
       sum({{decimals('t.value', var('token_decimals_var'))}}) as total_value
  from {{ ref('stg_token_transfers')}} as t 

where lower(t.token_address) = '{{ var("token_address_var")}}'

group by t.date, 
         t.token_address 
         