{% macro source_table(table_name) %}
{% if target.type == 'snowflake' %}
{{ target.database }}.{{ target.schema }}.{{ table_name }}
{% endif %}
{% endmacro %}