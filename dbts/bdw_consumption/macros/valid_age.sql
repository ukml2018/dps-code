{% macro test_valid_age(model, column_name, birth_date_column, date_format) %}

    SELECT *
    FROM {{ model }} 
    WHERE {{ column_name }} != DATEDIFF('year',TO_DATE({{ birth_date_column }},'{{ date_format }}'), CURRENT_DATE)

{% endmacro %}