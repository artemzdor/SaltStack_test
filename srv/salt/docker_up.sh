#!/usr/bin/env bash
echo "Docker Up All"
sudo salt "*" state.apply docker_up
