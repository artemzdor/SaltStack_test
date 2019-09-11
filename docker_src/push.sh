#!/usr/bin/env bash

export DOCKER_URL=asfree/test_erlang:latest

echo "Docker Push"

docker push $DOCKER_URL

echo "End"
