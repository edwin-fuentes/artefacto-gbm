FROM node:18.14.2

USER root

ARG APP_DIR_ARG
ARG APP_PORT_ARG
ARG ENV_ARG

ENV DEBIAN_FRONTEND=noninteractive
ENV APP_PORT=8080
ENV ENV=production

#RUN mkdir -p $APP_DIR

RUN apt-get update -qq -y && \
    npm i -g cross-env

WORKDIR /app

COPY . .

RUN npm install

COPY build/ public/

RUN ls public/
RUN pwd
EXPOSE $APP_PORT

CMD ["npm", "start"]
