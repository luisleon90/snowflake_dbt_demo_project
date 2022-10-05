{{ 
  audit_helper.compare_all_columns(
    a_relation=ref('stg_tpch_customers'),
    b_relation=api.Relation.create(database='analytics', schema='test', identifier='stg_tpch_customers'), 
    exclude_columns=['updated_at'], 
    primary_key='id'
  ) 
}}
left join {{ ref('stg_tpch_customers') }} using(id)