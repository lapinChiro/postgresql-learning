BEGIN;

DO $PROCEDURE$
DECLARE
  w_num SMALLINT;
  w_uuid UUID;

BEGIN

  FOR w_num IN 
    1..1000
  LOOP
    SELECT
        uuid
    FROM
        partitioned_balls
    ORDER BY
        RANDOM()
    LIMIT
        1
    INTO
        w_uuid
    ;
    DELETE FROM
        partitioned_balls
    WHERE
        uuid = w_uuid
    ;
  END LOOP;
END$PROCEDURE$;

COMMIT;
