with source as (

    select * from {{ source('synthea', 'encounters') }}

),

renamed as (

    select
        id,
        'start' as start_time,
        'stop' as stop_time,
        patient,
        organization,
        provider,
        payer,
        encounterclass,
        code,
        description,
        base_encounter_cost,
        total_claim_cost,
        payer_coverage,
        reasoncode,
        reasondescription

    from source

)

select * from renamed