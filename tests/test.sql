with diff as (

    {{ audit_helper.compare_relations(
        source('eth', 'contracts'),
        source('eth', 'contracts_clone')
    ) }}

)

select *
from diff
where not (in_a = true and in_b = true)