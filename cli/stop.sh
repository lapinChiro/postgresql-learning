#!/bin/sh 

docker stop $(docker ps -a -q -f name=mypostgres)