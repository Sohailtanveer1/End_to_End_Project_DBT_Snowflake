{{ config(
    materialized='incremental',
    alias = "shippings",
    pre_hook = "TRUNCATE TABLE {{ source('bronze', 'shippings') }}"
    ) }}

SELECT
    CAST(shipping_id AS INT) AS shipping_id,
    CAST(order_id AS INT) AS order_id,
    TRY_CAST(shipping_date AS DATE) AS shipping_date,
    TRIM(shipping_address) AS shipping_address,
    TRIM(shipping_method) AS shipping_method,
    TRIM(shipping_status) AS shipping_status,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'shippings') }}
WHERE shipping_id IS NOT NULL
