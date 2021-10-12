FROM node:lts-alpine as build-stage
RUN apk add yarn
RUN apk add git
RUN yarn global add @vue/cli
RUN yarn config set registry https://registry.npm.taobao.org/
