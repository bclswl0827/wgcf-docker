FROM ubuntu:18.04
LABEL maintainer "Yuki Kikuchi <bclswl0827@yahoo.co.jp>"
ENV DEBIAN_FRONTEND=noninteractive

ARG ARCH=${ARCH}
ADD bin/${ARCH} /usr/local/bin
ADD entrypoint.sh /entrypoint.sh

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections \
    && apt-get update; apt-get install -y wireguard iproute2 resolvconf \
    && chmod 755 -R /entrypoint.sh /usr/local/bin \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 10808
ENTRYPOINT ["/entrypoint.sh"]
