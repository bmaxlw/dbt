{% test country_exists(model, column_name, field) %}

    select {{ field }}
    from {{ model }}
    where {{ column_name }} = 'Iran'

{% endtest %}