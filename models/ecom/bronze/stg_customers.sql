{{ config(materialized='view') }}

SELECT
    CAST(customer_id AS INT) AS customer_id,
    TRIM(name) AS name,
    TRIM(city) AS city,
    TRIM(state) AS state,
    TRIM(country) AS country,
    TRY_CAST(registration_date AS DATE) AS registration_date,
    is_active::BOOLEAN AS is_active,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'customers') }}
WHERE customer_id IS NOT NULL
