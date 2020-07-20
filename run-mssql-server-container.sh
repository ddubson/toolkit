#!/usr/bin/env bash

set +e

MSSQL_PASSWORD=$1
MSSQL_DOCKER_IMAGE=mcr.microsoft.com/mssql/server:2019-CU5-ubuntu-18.04

docker pull $MSSQL_DOCKER_IMAGE

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
echo "🎉 Access the server @ localhost:1433, user: SA, pass: $MSSQL_PASSWORD"

# WARNING: The first time the script runs, it creates a Docker volume
#   called `sqlvolume`. After it is created, the password you chose the first
#   time is the password going forward, unless you remove the volume (which
#   destroys all data) by running `docker volume rm sqlvolume`
