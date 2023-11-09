{% macro current_date() %}
{% if target.type == 'synapse' %} 
    GETDATE()
{% else %}
    CURRENT_DATE
{% endif %}
{% endmacro %}