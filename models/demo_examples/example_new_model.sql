with data as 
(select * from {{ ref('agg_ship_modes_dynamic_pivot') }}
)

select * from data