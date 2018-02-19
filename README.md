# docker-nodejs

Node.js is a JavaScript-based platform for server-side and networking applications.

## Description

This image is based on the popular Alpine Linux project, available in the alpine official image. Alpine Linux is much smaller than most distribution base images (~5MB), and thus leads to much slimmer images in general.

Currently, the node version is `v8.9.4` for the default tag `latest`.

## Build

You can pull the image from `hub.docker.com`.

```sh
$ docker pull bingozb/nodejs
```

Or, you can build with source repository by yourself.

```sh
$ git clone https://github.com/bingozb/docker-nodejs.git
$ cd docker-nodejs
$ docker build -t bingozb/nodejs .
```

## Usage

First, put your node.js project in your host machine via `git` or `scp` and so on.

As we know, the node.js project usually deploy with thus step.

```sh
$ cnpm install
$ npm build
$ npm start
```

So, if you want to build a image with the whole nodejs environment, you can create your own Dockerfile and install cnpm.

```dockerfile
FROM bingozb/nodejs
RUN npm install cnpm -g --registry=https://registry.npm.taobao.org
...
ENTRYPOINT cnpm install && npm build && npm start
```

But I don't like it. I recommend separating build and deployment. It is recommended to use two hosts, one for build and one for deployment.

| Host | Job | Command |
| --- | --- | --- |
| Host A | build | cnpm install && npm build |
| Host B | deploy | npm start |

To be continued


