#!/usr/bin/env bash

export DOCKER_URL=asfree/test_erlang

echo "Docker Push"

docker push $DOCKER_URL

echo "End"
