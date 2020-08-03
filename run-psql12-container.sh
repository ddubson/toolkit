#!/usr/bin/env bash

# WARNING: The first time the script runs, it creates a Docker volume
#   called `psql12_volume`. After it is created, the password you chose the first
#   time is the password going forward, unless you remove the volume (which
#   destroys all data) by running `docker volume rm psql12_volume`

set +e

PSQL_PASSWORD=$1
PSQL_DOCKER_IMAGE=postgres:12.3
PSQL_CONTAINER_NAME=psql12_server
PSQL_VOLUME=psql12_volume

docker pull $PSQL_DOCKER_IMAGE

docker stop $PSQL_CONTAINER_NAME || true
docker rm $PSQL_CONTAINER_NAME || true

# Run container with psql12_volume created if not exists
docker run \
  -e "POSTGRES_PASSWORD=$PSQL_PASSWORD" \
  -p 5432:5432 \
  -v $PSQL_VOLUME:/var/lib/postgresql/data \
  --name $PSQL_CONTAINER_NAME \
  -d $PSQL_DOCKER_IMAGE

docker logs $PSQL_CONTAINER_NAME

echo "
-------------------------------------------------------------------------------

🎉 Access the server @ localhost:5432, user: 'postgres', pass: '$PSQL_PASSWORD'

✅ via Docker: docker exec -it $PSQL_CONTAINER_NAME psql -U postgres
✅ via local psql client: psql -h localhost -U postgres
   ...password at prompt: $PSQL_PASSWORD

-------------------------------------------------------------------------------
"

# For local connections, only the "psql" client is required. Install the libpq library only.
