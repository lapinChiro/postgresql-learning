DROP TABLE IF EXISTS balls CASCADE;
CREATE TABLE balls (
  uuid UUID NOT NULL DEFAULT gen_random_uuid()
  ,box_uuid UUID NOT NULL
  ,color TEXT NOT NULL
  ,radius NUMERIC NOT NULL
  ,weight NUMERIC NOT NULL
  ,PRIMARY KEY (uuid)
);
