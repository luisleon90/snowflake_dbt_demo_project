with customer_orders as (select * from {{ ref('fct_customer_orders') }})

select customer_key,
name
from customer_orders