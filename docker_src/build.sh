#!/usr/bin/env bash

echo "Start Build"

export GIT_CLONE=https://github.com/antibi0tic/websocket_chat.git
export DOCKER_URL=asfree/test_erlang:latest

echo "Git Clone: websocket_chat"

git clone $GIT_CLONE

echo "Docker Build"

docker build -t $DOCKER_URL .

echo "End"
