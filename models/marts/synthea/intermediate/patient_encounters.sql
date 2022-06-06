
with patients as (
    
    select * from {{ ref('stg_synthea_patients') }}

),

encounters as (

    select * from {{ ref('stg_synthea_encounters') }}

)
select 

    patients.id,
    patients.birthdate,
    patients.deathdate,
    patients.first,
    patients.last,
    patients.race,
    patients.ethnicity,
    encounters.encounter_start_time,
    encounters.encounter_stop_time,
    encounters.provider,
    encounters.payer,
    encounters.encounterclass,
    encounters.code,
    encounters.description,
    encounters.total_claim_cost,
    encounters.reasoncode,
    encounters.reasondescription

from
    patients
inner join encounters
        on patients.id = encounters.patient
order by
    encounters.encounter_stop_time