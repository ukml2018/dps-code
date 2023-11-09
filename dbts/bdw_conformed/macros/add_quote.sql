{% macro add_quote(col_name) %}
{% if target.type == 'bigquery' %}
    `{{ col_name }}`
{% elif target.type == 'snowflake' and col_name == 'timestamp' %}
    {{ col_name }}
{% else %}
    "{{ col_name }}"
{% endif %}
{% endmacro %}
