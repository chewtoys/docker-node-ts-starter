FROM node:10-alpine

RUN apk update && apk upgrade && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk add --no-cache \
      chromium@edge \
      nss@edge

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

RUN apk add dos2unix bash

ADD package*.json /nm/
WORKDIR /nm

RUN chmod 0777 /nm

RUN npm install
ADD . /code
WORKDIR /code
RUN dos2unix /code/scripts/*

RUN ln -sv /nm/node_modules /code/

ENV SESSION_DIR /tmp
ENV RUNS_IN_DOCKER 1

CMD bash /code/scripts/run-dev-watch-ts.sh
