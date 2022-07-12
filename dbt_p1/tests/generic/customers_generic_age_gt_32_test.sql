{% test age_gt_32(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} > 32

{% endtest %}