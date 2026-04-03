{% macro eth_decimals(column) %}

sum( {{ column}} )/1e18
    
{% endmacro %}



{% macro stable_decimals(column) %}

sum( {{ column}} )/1e6
    
{% endmacro %}



{% macro decimals(column, factor) %}

{{ column}} /power(10,{{ factor }})
    
{% endmacro %}
