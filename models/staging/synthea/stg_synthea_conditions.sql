with source as (

    select * from {{ source('synthea', 'conditions') }}

),

renamed as (

    select
        'start' as start_time,
        'stop' as stop_time,
        patient,
        encounter,
        code,
        description

    from source

)

select * from renamed