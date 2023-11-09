{% macro test_validate_regex(model, column_name, regex) %}

    SELECT *
    FROM {{ model }} 
    WHERE LENGTH({{ column_name }}) > 0 
      AND {{ column_name }} NOT regexp '{{ regex }}'

{% endmacro %}