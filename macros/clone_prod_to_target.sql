{#-

    This collection of macros enables developers to quickly recreate a development schema
    in Snowflake by cloning from production.

    To run it:
        $ dbt run-operation reset_dev_env --args '{from_schema: analytics}'

-#}

{%- macro reset_dev_env(from_schema, from_database='analytics') -%}

    {%- if target.name in ['dev', 'default'] -%}

        {{ destroy_current_env() }}

        {{ clone_prod_to_target(from_schema, from_database) }}

    {%- else -%}

        {{ dbt_utils.log_info("No-op: your current target is " ~ target.name ~ ". This macro only works for a dev target.") }}

    {%- endif -%}

{%- endmacro -%}

{%- macro destroy_current_env() -%}

    {%- set sql -%}
        drop schema if exists {{ target.database }}.{{ target.schema }} cascade;
    {%- endset -%}

    {{ dbt_utils.log_info("Dropping target schema.") }}

    {%- do run_query(sql) -%}

    {{ dbt_utils.log_info("Dropped target schema.") }}

{%- endmacro -%}

{%- macro clone_prod_to_target(from_schema, from_database='analytics') -%}

    {# The role that executes these statements will be the owner of the created schema and objects #}
    {%- set sql -%}
        create schema if not exists {{ target.database }}.{{ target.schema }} clone {{ from_database }}.{{ from_schema }} with managed access;
    {%- endset -%}

    {{ dbt_utils.log_info("Cloning schema " ~ from_database ~ "." ~ from_schema ~ " into " ~ target.database | lower ~ "." ~ target.schema) }}

    {%- do run_query(sql) -%}

    {{ dbt_utils.log_info("Cloned schema " ~ from_database ~ "." ~ from_schema ~ " into " ~ target.database | lower ~ "." ~ target.schema) }}

    {%- set sql_grants -%}
        grant ownership on all tables in schema {{ target.database }}.{{ target.schema }} to role {{ target.role }} copy current grants;
        grant ownership on all views in schema {{ target.database }}.{{ target.schema }} to role {{ target.role }} copy current grants;
    {%- endset -%}

    {{ dbt_utils.log_info("Transferring ownership to " ~ target.role | lower ~ ".") }}

    {%- do run_query(sql_grants) -%}

    {{ dbt_utils.log_info("Transferred ownership to " ~ target.role | lower ~ ".") }}

{%- endmacro -%}
