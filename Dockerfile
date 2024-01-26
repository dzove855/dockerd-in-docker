FROM debian

RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null 

RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras uidmap iproute2

RUN useradd rootless -u 1000 && mkdir /home/rootless && chown 1000:1000 /home/rootless

USER rootless

RUN mkdir /home/rootless/xdg
ENV XDG_RUNTIME_DIR=/home/rootless/xdg
ENV HOME=/home/rootless
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
