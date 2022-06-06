
with patients as (
    
    select * from {{ ref('stg_synthea_patients') }}

),

conditions as (

    select * from {{ ref('stg_synthea_conditions') }}

)

select 
    patients.id,
    patients.birthdate,
    patients.deathdate,
    patients.drivers,
    patients.first,
    patients.last,
    patients.ethnicity,
    patients.gender,
    conditions.code,
    conditions.description,
    conditions.condition_start_time,
    conditions.condition_stop_time


from
    patients
inner join conditions
        on patients.id = conditions.patient