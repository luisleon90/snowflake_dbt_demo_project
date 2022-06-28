with data as ( (
    select
        'ABC' as product,
        10 as quantity,
        20 as unit_price,
        current_date - 20 as sales_date
    )
    union
    (
    select
        current_date - 11 as sales_date,
        'ABC' as product,
        20 as quantity,
        18 as unit_price

    )
    union
    (
    select
        current_date - 8 as sales_date,
        'ABC' as product,
        10 as quantity,
        20 as unit_price

    )
    union
    (
    select
        current_date - 2 as sales_date,
        'EFG' as product,
        5 as quantity,
        10 as unit_price

    )
)

select * from data