SELECT
   movie_id,
   location_id AS location,
   DATE_TRUNC('month', month) AS month,
   SUM(total_invoice_sum) AS rental_cost
FROM {{ source('SILVERSCREEN', 'INVOICES') }}
GROUP BY movie_id, location, month
