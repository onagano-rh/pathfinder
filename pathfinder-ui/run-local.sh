#!/bin/sh

# Use Java 8, not 11.
export JAVA_HOME=/usr/lib/jvm/java-1.8.0

export PATHFINDER_SERVER=http://localhost:8080
export PATHFINDER_SELF=http://localhost:8083
mvn package -DdisableTracking=true -DskipTests -Djetty.port=8083 -DPATHFINDER_SERVER=http://localhost:8080 jetty:run
