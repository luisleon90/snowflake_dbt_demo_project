{{
    config(
        materialized='incremental'
    )
}}

select
    *

from {{ ref('snowflake_query_history') }}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where WATERMARK > (select max(WATERMARK) from {{ this }})

{% endif %}