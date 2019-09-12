#!/usr/bin/env bash
echo "Docker Down All"
sudo salt "*" state.apply docker_down
