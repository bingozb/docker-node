FROM alpine
MAINTAINER bingo <bingov5@icloud.com>

ARG NODE_VERSION=v8.9.4
ARG WORK=/nodejs

RUN apk --no-cache add wget
RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate http://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz | tar -xzf - -C $WORK --strip-components=1

ENV PATH $PATH:/nodejs/bin
ENV SERVER_PORT 3000

WORKDIR /app

EXPOSE $SERVER_PORT

ENTRYPOINT npm start