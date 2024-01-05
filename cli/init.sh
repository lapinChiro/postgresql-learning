#!/bin/sh 

./cli/stop.sh
./cli/remove.sh
docker image build -t mypostgres .
docker container run --name mypostgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d mypostgres
