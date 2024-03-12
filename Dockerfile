FROM node:18.14.2

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV APP_PORT=8080
ENV ENV=production

RUN apt-get update -qq -y && \
    npm i -g cross-env

RUN apt-get update prueba 

WORKDIR /app

COPY . .

RUN npm install

COPY build/ public/

EXPOSE $APP_PORT

CMD ["npm", "start"]
