select *
  from {{ ref('stg_transactions') }}
where from_address in ('0xc7ba7b15a8edf6071f70cf316d81cb02d561ba73', '0x2c0c5d6c0a86a0e10dfe77bfe500117498fdf862')
 