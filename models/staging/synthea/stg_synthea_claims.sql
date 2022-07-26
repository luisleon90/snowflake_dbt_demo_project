with source as (

    select * from {{ source('synthea', 'claims') }}

),

renamed as (

    select
        id,
        patientid,
        providerid,
        primarypatientinsuranceid,
        secondarypatientinsuranceid,
        departmentid,
        patientdepartmentid,
        diagnosis1,
        diagnosis2,
        diagnosis3,
        diagnosis4,
        diagnosis5,
        diagnosis6,
        diagnosis7,
        diagnosis8,
        referringproviderid,
        appointmentid,
        currentillnessdate,
        servicedate,
        supervisingproviderid,
        status1,
        status2,
        statusp,
        oustanding1,
        outstanding2,
        outstandingp,
        lastbilleddate,
        lastbilleddate2,
        lastbilleddatep,
        healthcareclaimtypeid1,
        healthcarelciamtypeid2,
        0

    from source

)

select * from renamed