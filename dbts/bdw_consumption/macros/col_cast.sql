{% macro col_cast(source_col, target_col, length) %}
{% if target.type == 'bigquery' %}
    {% if target_col =='varchar' %}
        {{ dbt.safe_cast(source_col, api.Column.translate_type("string")) }}
    {% elif target_col =='integer' %}
        {{ dbt.safe_cast(source_col, api.Column.translate_type("integer")) }}
    {% elif target_col =='timestamp' %}
        {{ dbt.safe_cast(source_col, api.Column.translate_type("timestamp")) }}
    {% else %}
        {{ dbt.safe_cast(source_col, api.Column.translate_type("string")) }}
    {% endif %}
{% else %}
    {% if target_col =='varchar' %}
        {{ dbt.safe_cast(source_col, api.Column.string_type(length)) }}
    {% elif target_col =='integer' %}
        {{ dbt.safe_cast(source_col, api.Column.translate_type("integer")) }}
    {% elif target_col =='timestamp' %}
        {{ dbt.safe_cast(source_col, api.Column.translate_type("timestamp")) }}
    {% else %}
        {{ dbt.safe_cast(source_col, api.Column.translate_type("string")) }}
    {% endif %}
{% endif %}
{% endmacro %}
