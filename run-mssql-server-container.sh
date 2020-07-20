#!/usr/bin/env bash

set +e

MSSQL_PASSWORD=$1
PERSIST_HOST_DIR=~/mssql-docker-data
MSSQL_DOCKER_IMAGE=mcr.microsoft.com/mssql/server:2019-CU5-ubuntu-18.04

docker pull $MSSQL_DOCKER_IMAGE

mkdir -p $PERSIST_HOST_DIR

docker stop mssql_server || true
docker rm mssql_server || true

# Run container with sqlvolume created if not exists
docker run \
  -e 'ACCEPT_EULA=Y' \
  -e "MSSQL_SA_PASSWORD=$MSSQL_PASSWORD" \
  -p 1433:1433 \
  -v sqlvolume:/var/opt/mssql \
  --name mssql_server \
  -d $MSSQL_DOCKER_IMAGE

docker logs mssql_server

echo ""
echo "🎉 Access the server @ localhost:1433, pass: $MSSQL_PASSWORD"
