#Preparing base that can be used for development
FROM node:14-alpine as base

ENV NODE_ENV=development
ENV APP_PORT=3333
ENV APP_ADDRESS=0.0.0.0
ENV APP_PATH=/home/node/app
ENV NPM_CACHE_PATH=/home/node/npm_temporary_cache

RUN apk add git
RUN npm i npm@8

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY . $APP_PATH

RUN chown -R node:node $APP_PATH

USER node

RUN mkdir -p $NPM_CACHE_PATH

RUN npm install --cache $NPM_CACHE_PATH

RUN rm -rf $NPM_CACHE_PATH

RUN npm run build

EXPOSE $APP_PORT

CMD ["npm", "run", "serve:dev"]

