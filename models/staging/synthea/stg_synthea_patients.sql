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
        regexp_substr(first, '[A-Za-z]*') as first,
        regexp_substr(first, '[A-Za-z]*') as last,
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