BEGIN;

DO $PROCEDURE$
DECLARE
  w_num SMALLINT;
BEGIN
  FOR w_num IN 
    1..10
  LOOP
    INSERT INTO boxes (
      capacity
    ) VALUES (
      ROUND(( RANDOM() * (1 - 100) )::NUMERIC, 0) + 100
    )
    ;
  END LOOP;
END$PROCEDURE$;

COMMIT;
