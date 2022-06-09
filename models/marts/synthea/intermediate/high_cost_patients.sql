with patient_encounters as (

    select * from {{ ref('patient_encounters') }}

)

select
    patient_encounters.id,
    patient_encounters.last,
    sum(total_claim_cost) as total_cost
    
from
    patient_encounters
where deathdate is null /* filtering out deceased patients */
group by id, last
having sum(total_claim_cost) > 2500
order by total_cost desc