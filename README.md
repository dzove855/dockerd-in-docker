# Dockerd-in-docker

NOTE: this is only for testing purpose and is not yet completely tested.

The end goal will be to run the docker daemon and container completely without privileged!


The path to the docker socket: /home/rootless/xdg/docker.socket


```
# docker build -t dockerd-in-docker .

# docker run --privileged --security-opt seccomp=unconfined --security-opt apparmor=unconfined dockerd-in-docker 
```
