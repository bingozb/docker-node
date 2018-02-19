FROM debian:wheezy
MAINTAINER bingo <bingo@dankal.cn>

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl
RUN mkdir /nodejs && curl http://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/nodejs/bin/npm", "start"]