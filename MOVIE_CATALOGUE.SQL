SELECT
   movie_id,
   movie_title,
   COALESCE(genre, 'Unknown') AS genre,
   studio
FROM {{ source('SILVERSCREEN', 'MOVIE_CATALOGUE') }}
