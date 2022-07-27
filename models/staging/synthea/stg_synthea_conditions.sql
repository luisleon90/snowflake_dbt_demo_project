with source as (

    select * from {{ source('synthea', 'conditions') }}

),

renamed as (

    select
        "START" as condition_start_time,
        "STOP" as condition_stop_time,
        patient,
        encounter,
        code,
        description,
        0

    from source

)

select * from renamed