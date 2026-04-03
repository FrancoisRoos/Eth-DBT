{%macro random_macro() %}

    {% set query%}

        select distinct token_address
        from {{ ref('stg_token_transfers') }}
        limit 10

    {% endset %}

    {% if execute %}

        {% set results = run_query(query) %}

        {% set result_list = results.columns[0].values() %}

    {%else%}

        {% set result_list = [] %}

    {% endif %}

    {{ log(result_list, info = True) }}

    {{ return(result_list) }}

{% endmacro %}