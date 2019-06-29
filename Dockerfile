FROM debian

ENV VERSION 1.4.0

RUN apt-get update && \
    apt-get install -y wget unzip && \
    mkdir -p /hs && \
    wget -O /tmp/install.zip https://n1.siaprime.net/releases/${VERSION}/SiaPrime-v${VERSION}-linux-arm.zip && \
    unzip -d /tmp/install/ /tmp/install.zip && \
    mv /tmp/install/SiaPrime-v${VERSION}-linux-arm/spc /usr/local/bin/ && \
    mv /tmp/install/SiaPrime-v${VERSION}-linux-arm/spd /usr/local/bin/ && \
    rm -rf /tmp/install/ /tmp/install.zip /var/lib/apt/lists

WORKDIR /sp
EXPOSE 4281 4282

CMD ["/usr/local/bin/spd"]
