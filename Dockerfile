FROM debian

ENV VERSION 1.4.0

RUN apt-get update && \
    apt-get install -y wget unzip && \
    mkdir -p /hs && \
    wget -O /tmp/install.zip https://n1.siaprime.net/releases/1.4.0/SiaPrime-v1.4.0-RC5-ea1b5280-debug-contracthack-linux-amd64.zip && \
    unzip -d /tmp/install/ /tmp/install.zip && \
    mv /tmp/install/SiaPrime-v${VERSION}-linux-amd64/spc /usr/local/bin/ && \
    mv /tmp/install/SiaPrime-v${VERSION}-linux-amd64/spd /usr/local/bin/ && \
    rm -rf /tmp/install/ /tmp/install.zip /var/lib/apt/lists

WORKDIR /sp
EXPOSE 4281 4282

CMD ["/usr/local/bin/spd"]
