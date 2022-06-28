with data as (
    select
    *
    from {{ ref('sales_history') }}

)

select
    {{ dbt_utils.surrogate_key(['product_color', 'product_code']) }} as surrogate_key,
    product_key,
    product_code,
    product_color,
    sales_date,
    quantity,
    unit_price,
    sale_ammount
from data