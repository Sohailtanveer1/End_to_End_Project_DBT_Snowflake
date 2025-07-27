{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_sk,
    customer_id,
    name,
    customer_location,
    is_active,
    registration_date
FROM {{ ref('stg_customers') }}
