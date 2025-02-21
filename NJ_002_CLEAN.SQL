SELECT
   movie_id,
   DATE_TRUNC('month', date) AS month,
   'NJ_002' AS location,
   SUM(ticket_amount) AS tickets_sold,
   SUM(total_earned) AS revenue
FROM {{ source('SILVERSCREEN', 'NJ_002') }}
GROUP BY movie_id, month, location
