#!/bin/bash
export HOME=/home/rootless
dockerd-rootless-setuptool.sh install 
systemctl --user cat docker.service
printf 'Start Rootless Docker'


dockerd-rootless.sh
