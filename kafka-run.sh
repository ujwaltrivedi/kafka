#!/bin/bash

KAFKA_HOME=/root/kafka_2.13-2.5.1



source "$KAFKA_HOME/bin/zookeeper-server-start.sh" "$KAFKA_HOME/config/zookeeper.properties" &

source "$KAFKA_HOME/bin/kafka-server-start.sh" "$KAFKA_HOME/config/server.properties" &

wait

#exit $?




