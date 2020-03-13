FROM node:6-alpine

COPY ./ /app

CMD cd pokedex-go

RUN npm install

CMD ['npm', 'start']