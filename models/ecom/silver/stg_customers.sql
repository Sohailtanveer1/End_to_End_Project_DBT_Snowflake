{{ config(materialized='incremental',
    pre_hook = "TRUNCATE TABLE {{source('silver','stg_customers')}}"
) }}

SELECT
    customer_id,
    name,
    city,
    state,
    country,
    registration_date,
    is_active,
    CONCAT_WS(', ', city, state, country) AS customer_location,
    etl_timestamp
FROM {{ ref('clean_customers') }}
