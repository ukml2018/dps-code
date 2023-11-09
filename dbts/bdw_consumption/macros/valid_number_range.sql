{% macro test_valid_number_range(model, column_name, from, to) %}

    SELECT *
    FROM {{ model }} 
    WHERE {{ column_name }} NOT BETWEEN {{ from }} AND {{ to }}

{% endmacro %}