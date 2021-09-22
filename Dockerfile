FROM debian:bullseye-20210902-slim

LABEL org.opencontainers.image.title="RTSP AWS CLI"
LABEL org.opencontainers.image.authors="RTSP <docker@rtsp.us>"
LABEL org.opencontainers.image.source="https://github.com/rtsp/docker-aws-cli"
LABEL org.opencontainers.image.licenses="Apache-2.0"

RUN set -x && apt-get update && apt-get --yes --no-install-recommends install \
    bash \
    ca-certificates \
    coreutils \
    curl \
    diffutils \
    git \
    gnupg \
    grep \
    iputils-ping \
    jq \
    less \
    mawk \
    nano \
    openssl \
    rsync \
    sed \
    telnet \
    unzip \
    vim-tiny \
    wget \
    && rm -rvf /var/lib/apt/lists/*

ARG AWSCLI_ARCH=x86_64
ARG AWSCLI_VERSION=2.2.39

RUN set -x \
    && mkdir -p /tmp/awscli && cd /tmp/awscli \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-${AWSCLI_ARCH}-${AWSCLI_VERSION}.zip" -o awscliv2.zip \
    && unzip -q awscliv2.zip \
    && ./aws/install \
    && rm -rf /tmp/awscli \
    && /usr/local/bin/aws --version

COPY files/ /root/

CMD ["/bin/sleep", "365d"]
