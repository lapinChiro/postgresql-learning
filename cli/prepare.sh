#!/bin/sh 

cat ./tables/boxes.sql > /tmp/prepare.sql
cat ./tables/balls.sql >> /tmp/prepare.sql

cat ./seeds/0_boxes.sql >> /tmp/prepare.sql
cat ./seeds/1_balls.sql >> /tmp/prepare.sql

PGPASSWORD=postgres psql -U postgres -d postgres -h localhost -f /tmp/prepare.sql