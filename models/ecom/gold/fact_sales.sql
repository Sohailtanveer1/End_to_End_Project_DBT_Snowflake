{{ config(materialized='table') }}

SELECT
    o.order_id AS order_sk,
    c.customer_id AS customer_sk,
    i.item_id AS item_sk,
    o.order_date,
    ol.quantity,
    ol.unit_price,
    ol.total_price,
    p.amount AS payment_amount,
    s.shipping_date,
    s.delivery_days,
    p.payment_method,
    s.shipping_method,
    o.status AS order_status,
    s.shipping_status
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_order_lines') }} ol ON o.order_id = ol.order_id
JOIN {{ ref('stg_customers') }} c ON o.customer_id = c.customer_id
JOIN {{ ref('stg_items') }} i ON ol.item_id = i.item_id
LEFT JOIN {{ ref('stg_payments') }} p ON o.order_id = p.order_id
LEFT JOIN {{ ref('stg_shippings') }} s ON o.order_id = s.order_id
