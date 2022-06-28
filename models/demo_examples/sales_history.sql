with data as
(
    select
    *
    from {{ ref('product_history') }} product
    left join {{ ref('sales') }} sales
    on product.product_code=sales.product
    and sales.sales_date > product.valid_from_dt
    and sales.sales_date <= product.valid_to_dt

)

select
    product_key,
    product_code,
    product_color,
    sales_date,
    quantity,
    unit_price,
    quantity * unit_price as sale_ammount
from data