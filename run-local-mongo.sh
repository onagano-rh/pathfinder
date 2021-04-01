#!/bin/sh

set -x

DOCKER=docker
#DOCKER=podman
CONTAINER=mongodb

# Create and run the container.
$DOCKER run -d --name $CONTAINER -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=adminuser \
  -e MONGO_INITDB_ROOT_PASSWORD=password \
  docker.io/library/mongo:3.6

/usr/bin/sleep 10

# Create user "testuser/password" in "pathfinder" DB.
$DOCKER exec -it $CONTAINER mongo --quiet --host localhost \
  -u adminuser -p password --authenticationDatabase admin \
  pathfinder --eval 'db.createUser({user:"testuser",pwd:"password",roles:[{role:"readWrite",db:"pathfinder"}]})'

# Use run command second or later times.
echo "Use '$DOCKER stop|start $CONTAINER' afterward."
