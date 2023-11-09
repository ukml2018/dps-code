{% macro test_valid_date(model, column_name) %}

    SELECT *
    FROM {{ model }} 
    WHERE  MONTH({{ column_name }}) NOT BETWEEN 1 AND 12
       OR DAY({{ column_name }}) NOT BETWEEN 1 AND 31 
       OR YEAR({{ column_name }}) NOT BETWEEN 1900 AND YEAR(CURRENT_TIMESTAMP) 

{% endmacro %}