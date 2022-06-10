select
    nation_key,
    name,
    region_key,
    comment
from {{ ref('stg_tpch_nations') }}