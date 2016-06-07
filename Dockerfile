FROM alpine:3.4
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

RUN mkdir -pv /root/.ssh

COPY files/keygen /usr/local/bin/keygen
RUN chmod +x /usr/local/bin/keygen

RUN apk add --update openssh-client \
    && rm -rf /var/cache/apk/*

VOLUME /root/.ssh

ENTRYPOINT ["ssh", "-v", "-C", "-N", "-D", "0.0.0.0:1080"]
