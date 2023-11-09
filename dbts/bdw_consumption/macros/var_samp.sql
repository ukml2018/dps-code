{% macro var_samp(col_name) %}
{% if target.type == 'synapse' %} 
    VAR({{ col_name }})
{% else %}
    VAR_SAMP({{ col_name }})
{% endif %}
{% endmacro %}