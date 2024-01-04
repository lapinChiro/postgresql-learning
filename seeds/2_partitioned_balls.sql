BEGIN;

DO $PROCEDURE$
DECLARE
  w_num SMALLINT;
  w_container_uuid_array UUID[];
  w_container_uuid UUID;
  w_index NUMERIC;
  w_uuid UUID;

  c_color_array TEXT[] := '{
      red
      ,green
      ,blue
      ,pink
      ,yellow
      ,white
      ,black
      ,purple
      ,gray
      ,brown
    }'::TEXT[];
BEGIN
  SELECT
    ARRAY_AGG(uuid)
  FROM
    boxes
  INTO
    w_container_uuid_array
  ;

  IF CARDINALITY(w_container_uuid_array) = 0 THEN
    RAISE 'Prepare ./0_boxes.sql';
  END IF;

  FOR w_num IN 
    1..1000
  LOOP
    w_container_uuid := w_container_uuid_array[ROUND(( RANDOM() * (1 - 10) )::NUMERIC, 0) + 10];
    PERFORM
    FROM
      pg_tables
    WHERE
      tablename LIKE 'partitioned_balls_%'
      AND tablename LIKE '%' || w_container_uuid::TEXT
    ;
    IF NOT FOUND THEN
      EXECUTE $$
        CREATE TABLE "partitioned_balls_$$ || w_container_uuid || $$"
        PARTITION OF partitioned_balls FOR VALUES IN ('$$ || w_container_uuid || $$')
      $$;
    END IF;

    INSERT INTO partitioned_balls (
      color
      ,box_uuid
      ,radius
      ,weight
    ) VALUES (
      c_color_array[ROUND(( RANDOM() * (1 - 10) )::NUMERIC, 0) + 10]
      ,w_container_uuid
      ,ROUND(( RANDOM() * (1 - 10) )::NUMERIC, 0) + 10
      ,ROUND(( RANDOM() * (1 - 1000) )::NUMERIC, 0) + 1000
    )
    ;
  END LOOP;
END$PROCEDURE$;

COMMIT;
