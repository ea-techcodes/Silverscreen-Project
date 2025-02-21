{{ config(materialized='table')}}
WITH sales AS (
   SELECT * FROM {{ ref('UNIFY') }}
),
movies AS (
   SELECT * FROM {{ ref('MOVIE_CATALOGUE_CLEAN') }}
),
invoices AS (
   SELECT * FROM {{ ref('INVOICE_CLEAN') }}
)
SELECT
   sales.movie_id,
   movies.movie_title,
   movies.genre,
   movies.studio,
   sales.month,
   sales.location,
   COALESCE(invoices.rental_cost, 0) AS rental_cost,
   sales.tickets_sold,
   sales.revenue
FROM sales
LEFT JOIN movies ON sales.movie_id = movies.movie_id
LEFT JOIN invoices
   ON sales.movie_id = invoices.movie_id
   AND sales.month = invoices.month
   AND sales.location = invoices.location
