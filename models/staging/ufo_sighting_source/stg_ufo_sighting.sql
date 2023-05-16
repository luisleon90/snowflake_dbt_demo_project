with source as (select * from {{ source('ufo', 'ufo_siting_in_spain') }})

select
    *
from source