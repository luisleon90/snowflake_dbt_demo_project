with data as ( (
    select
        1 as product_key,
        'ABC' as product_code,
        'Blue' as product_color,
        current_date - 30 as valid_from_dt,
        current_date - 10 as valid_to_dt
    )
    union
    (
        select
            2 as product_key,
            'ABC' as product_code,
            'Red' as product_color,
            current_date - 10 as valid_from_dt,
            current_date + 1000000 as valid_to_dt

    )
    union
    (
    select
        3 as product_key,
        'EFG' as product_code,
        'Yellow' as product_color,
        current_date - 60 as valid_from_dt,
        current_date + 1000000 as valid_to_dt

    )
)

select * from data