FROM node:18.14.2

USER root

ARG APP_DIR_ARG
ARG APP_PORT_ARG
ARG ENV_ARG

ENV BASE_DIR=/home/artefacto
ENV DEBIAN_FRONTEND=noninteractive
ENV APP_PORT=300
ENV ENV=production

#RUN mkdir -p $APP_DIR

RUN apt-get update -qq -y && \
    npm i -g cross-env

WORKDIR /home/artefacto

COPY . .

RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

CMD npm run start

EXPOSE $APP_PORT


