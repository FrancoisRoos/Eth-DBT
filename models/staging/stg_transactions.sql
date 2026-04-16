{{ config(materialized = 'incremental', incremental_strategy = 'merge', unique_key = 'hash') }}

select hash,
       block_number,
       date,
       from_address,
       to_address,
       value,
       receipt_contract_address,
       input,
       tt.token_transfer_count,

case
    when t.receipt_contract_address != '' then 'contract_creation'
    when tt.transaction_hash is not null then 'token_transfer'
    when t.input = '0x' and t.value > 0 then 'plain_eth_transfer'
    else 'other'
end as transaction_category

from {{ source('eth','transactions')}} t

left join (

	select
	transaction_hash,
	count(*) as token_transfer_count
	from {{ source('eth','token_transfers')}}
	group by transaction_hash
	) tt

on t.hash = tt.transaction_hash

    {% if is_incremental() %}

  where date >= (select max(date) from {{ this }})

  {% endif %}
