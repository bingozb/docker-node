FROM node:8.9.4-slim
MAINTAINER bingo <bingo@dankal.cn>

ENV DEBIAN_FRONTEND noninteractive
ENV NODE_ENV development

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["npm", "start"]
