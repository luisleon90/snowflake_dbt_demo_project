select
    c_custkey,
    c_name
from {{ source('tpch', 'customer') }}