with source as (

    select * from {{ source('synthea', 'encounters') }}

),

renamed as (

    select
        id,
        "START" as encounter_start_time,
        "STOP" as encounter_stop_time,
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