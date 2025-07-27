{{ config(materialized='incremental',
    pre_hook = "TRUNCATE TABLE {{source('bronze','clean_customers')}}"
    )
}}

SELECT
    CAST(customer_id AS INT) AS customer_id,
    TRIM(name) AS name,
    TRIM(city) AS city,
    TRIM(state) AS state,
    TRIM(country) AS country,
    TRY_CAST(registration_date AS DATE) AS registration_date,
    is_active::BOOLEAN AS is_active,
    etl_timestamp
FROM {{ ref('raw_customers') }}
