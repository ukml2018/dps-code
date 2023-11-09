{% macro test_valid_min_number(model, column_name, from) %}

    SELECT *
    FROM {{ model }} 
    WHERE {{ column_name }} < {{ from }}

{% endmacro %}