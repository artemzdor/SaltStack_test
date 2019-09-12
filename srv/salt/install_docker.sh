#!/usr/bin/env bash
echo "Docker Install All"
sudo salt "*" state.apply docker_install
