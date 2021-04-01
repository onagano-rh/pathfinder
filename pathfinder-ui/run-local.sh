#!/bin/sh

export PATHFINDER_SERVER=http://localhost:8080
export PATHFINDER_SELF=http://localhost:8083
mvn package -DdisableTracking=true -DskipTests -Djetty.port=8083 -DPATHFINDER_SERVER=http://localhost:8080 jetty:run
