{{ config(materialized='table') }}

SELECT
    customer_id,
    name,
    city,
    state,
    country,
    registration_date,
    is_active,
    CONCAT_WS(', ', city, state, country) AS customer_location,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'customers') }}
WHERE customer_id IS NOT NULL
