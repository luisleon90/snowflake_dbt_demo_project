with source as (

    select * from {{ source('synthea', 'patients') }}

),

renamed as (

    select
        id,
        birthdate,
        deathdate,
        ssn,
        drivers,
        passport,
        prefix,
        first,
        last,
        suffix,
        maiden,
        marital,
        race,
        ethnicity,
        gender,
        birthplace,
        address,
        city,
        state,
        county,
        zip,
        lat,
        lon,
        healthcare_expenses,
        healthcare_coverage

    from source

)

select * from renamed