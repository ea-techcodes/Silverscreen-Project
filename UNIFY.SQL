
WITH NJ_001 AS (
   SELECT * FROM {{ ref('NJ_001_CLEAN') }}
),
NJ_002 AS (
   SELECT * FROM {{ ref('NJ_002_CLEAN') }}
),
NJ_003 AS (
   SELECT * FROM {{ ref('NJ_003_CLEAN') }}
)
SELECT * FROM NJ_001
UNION ALL
SELECT * FROM NJ_002
UNION ALL
SELECT * FROM NJ_003
