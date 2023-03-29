FROM node:18.14.2

USER root

ARG APP_DIR_ARG
ARG APP_PORT_ARG
ARG ENV_ARG

ENV BASE_DIR=$APP_DIR
ENV DEBIAN_FRONTEND=noninteractive
ENV APP_PORT=$APP_PORT
ENV ENV=$ENV

RUN mkdir -p $APP_DIR_ARG

RUN apt-get update -qq -y && \
    npm i -g cross-env

WORKDIR $BASE_DIR

COPY . .

RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT entrypoint.sh

EXPOSE $APP_PORT


