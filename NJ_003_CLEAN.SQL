SELECT
   details AS movie_id,
   DATE_TRUNC('month', timestamp) AS month,
   'NJ_003' AS location,
   SUM(amount) AS tickets_sold,
   SUM(total_value) AS revenue
FROM {{ source('SILVERSCREEN', 'NJ_003') }}
WHERE product_type = 'ticket'
GROUP BY movie_id, month, location
