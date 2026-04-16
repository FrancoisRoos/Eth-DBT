select *
  from {{ ref('stablecoin_activity', v = 2) }}
where type = 'Fiat-backed'