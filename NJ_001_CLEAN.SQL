SELECT
   movie_id,
   DATE_TRUNC('month', timestamp) AS month,
   'NJ_001' AS location,
   SUM(ticket_amount) AS tickets_sold,
   SUM(transaction_total) AS revenue
FROM {{ source('SILVERSCREEN', 'NJ_001') }}
GROUP BY movie_id, month, location
