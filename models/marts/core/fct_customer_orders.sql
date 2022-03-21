{{
    config(
        materialized = 'table',
        transient=false
    )
}}

with customer as (

    select * from {{ ref('dim_customers') }}

),
orders as (

    select * from {{ ref('fct_orders') }}

),
final as (
    select 
        customer.customer_key,
        customer.name,
        customer.region_key,
        orders.net_item_sales_amount,
        orders.order_date,
        0

    from
        orders
        left join customer
            on orders.customer_key = customer.customer_key
)
select 
    *
from
    final
order by
   order_date
