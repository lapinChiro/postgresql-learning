DROP TABLE IF EXISTS partitioned_balls CASCADE;
CREATE TABLE partitioned_balls (
  uuid UUID NOT NULL DEFAULT gen_random_uuid() 
  ,box_uuid UUID NOT NULL
  ,color TEXT NOT NULL
  ,radius NUMERIC NOT NULL
  ,weight NUMERIC NOT NULL
  ,PRIMARY KEY(uuid, box_uuid)
) PARTITION BY LIST (box_uuid);