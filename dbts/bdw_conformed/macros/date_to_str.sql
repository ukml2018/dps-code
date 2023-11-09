{% macro date_to_str(col_name) %}
{% if target.type == 'bigquery' %}
    {{ dbt.safe_cast(col_name, api.Column.translate_type("string")) }}
{% elif target.type == 'snowflake' %}
    TO_VARCHAR({{ col_name }}, 'yyyy-mm-dd')
{% else %}
    {{ dbt.safe_cast(col_name, api.Column.string_type(20)) }}
{% endif %}
{% endmacro %}
