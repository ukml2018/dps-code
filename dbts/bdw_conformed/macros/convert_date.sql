{# This macros is only used to build a date in format yyyy-<m>m-<d>d from a string in format <m>m/<d>d/yyyy #}
{% macro convert_date(col_name) %}
{% set year = dbt.split_part(string_text=col_name, delimiter_text="'/'", part_number=3) %}
{% set month = dbt.split_part(string_text=col_name, delimiter_text="'/'", part_number=1) %}
{% set day = dbt.split_part(string_text=col_name, delimiter_text="'/'", part_number=2) %}
{{ dbt.safe_cast(dbt.concat([year, "'-'", month, "'-'", day]), api.Column.translate_type("date")) }}
{% endmacro %} 
