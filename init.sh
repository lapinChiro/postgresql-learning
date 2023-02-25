#!/bin/sh 

docker image build -t mypostgres .
docker container run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d mypostgres