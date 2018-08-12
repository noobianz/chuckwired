#!/bin/bash
CONTAINERS="chuck_1 chuck_2 chuck_2"

while [ true ]
do
  for CONTAINER in $CONTAINERS
  do
    RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER)
      if [ "$RUNNING" != "true" ]
      then
           logger "$CONTAINER is Down."
           sleep 5
      fi
  done
done
