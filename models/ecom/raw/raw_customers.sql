{{ 
    config(
        materialized='ephemeral'
        ) 
}}

SELECT
    customer_id,
    name,
    city,
    state,
    country,
    registration_date,
    is_active,
    current_timestamp as etl_timestamp
FROM {{ source('raw', 'customers') }}
where customer_id is not null
