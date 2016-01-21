FROM alpine:3.3
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

RUN mkdir -pv /root/.ssh

COPY files/keygen /usr/bin/keygen
RUN chmod +x /usr/bin/keygen

RUN apk add --update openssh-client \
    && rm -rf /var/cache/apk/*

VOLUME /root/.ssh

ENTRYPOINT ["ssh", "-v", "-C", "-N", "-D", "0.0.0.0:1080"]
