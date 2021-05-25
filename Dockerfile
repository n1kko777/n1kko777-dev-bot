FROM node:15-alpine3.11 as build
RUN apk add --no-cache --virtual .gyp \
        python \
        make \  
        g++

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

RUN apk del .gyp

CMD [ "npm", "start" ]