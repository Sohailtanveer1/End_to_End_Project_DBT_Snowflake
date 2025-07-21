{{ config(materialized='table') }}

WITH dates AS (
    SELECT
        DATEADD(day, seq4(), '2019-01-01') AS date
    FROM TABLE(GENERATOR(ROWCOUNT => 2000))
)

SELECT
    date,
    EXTRACT(year FROM date) AS year,
    EXTRACT(month FROM date) AS month,
    EXTRACT(quarter FROM date) AS quarter,
    EXTRACT(week FROM date) AS week,
    TO_CHAR(date, 'Day') AS day_of_week,
    CASE WHEN DAYOFWEEK(date) IN (1, 7) THEN TRUE ELSE FALSE END AS is_weekend
FROM dates
