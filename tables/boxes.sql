DROP TABLE IF EXISTS boxes CASCADE;
CREATE TABLE boxes (
  uuid UUID NOT NULL DEFAULT gen_random_uuid()
  ,capacity SMALLINT NOT NULL
  ,PRIMARY KEY (uuid)
);
