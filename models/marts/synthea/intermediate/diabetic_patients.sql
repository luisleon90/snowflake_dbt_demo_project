with patient_cohort as (

    select * from {{ ref('patient_conditions') }}

)
select 

    *

from
    patient_cohort
where description ilike '%diabet%'