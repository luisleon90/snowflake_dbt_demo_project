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
            'ABC' as product,
            20 as quantity,
            18 as unit_price,
            current_date - 11 as sales_date

    )
    union
    (
        select
            'ABC' as product,
            10 as quantity,
            20 as unit_price,
            current_date - 8 as sales_date

    )
    union
    (
        select
            'EFG' as product,
            5 as quantity,
            10 as unit_price,
            current_date - 2 as sales_date

    )
        union
    (
        select
            'LMN' as product,
            15 as quantity,
            15 as unit_price,
            current_date - 3 as sales_date

    )
)

select * from data