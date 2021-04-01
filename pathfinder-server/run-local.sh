#!/bin/sh

# Use Java 8, not 11.
export JAVA_HOME=/usr/lib/jvm/java-1.8.0

mvn spring-boot:run -Dspring.profiles.active=dev,swagger
