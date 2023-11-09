{% macro test_valid_date_range(model, column_name, from, to) %}

    SELECT *
    FROM {{ model }} 
    WHERE TO_DATE({{ column_name }}) NOT BETWEEN TO_DATE('{{ from }}', 'MM/DD/YYYY') AND GETDATE()

{% endmacro %}