# ballsとpartitioned_ballsのページ数
SELECT
    SUM(relpages) AS total_relpages
    ,SUM(reltuples) AS total_reltuples
FROM
    pg_class
WHERE
    relname LIKE 'partitioned_balls%'
    AND relname NOT LIKE '%pkey'
;

SELECT
    COUNT(*)
FROM
    partitioned_balls
;

SELECT
    relpages
    ,reltuples
FROM
    pg_class
WHERE
    relname = 'balls'
;

# tupleの分布
SELECT
    relname
    ,relpages
    ,reltuples
    ,CASE WHEN relpages > 0 THEN 
        (reltuples/relpages)::NUMERIC
    ELSE
        0
    END AS tuple_count_per_page
FROM
    pg_class
WHERE
    relname LIKE '%balls%'
ORDER BY
    tuple_count_per_page
    ,relname
;