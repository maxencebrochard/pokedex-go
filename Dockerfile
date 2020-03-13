FROM node:6-alpine

COPY . /app

WORKDIR /app

RUN npm install

CMD ['npm', 'start']