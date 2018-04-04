FROM node:8-alpine

ENV NODE_ENV=production

RUN mkdir /app
WORKDIR /app

RUN npm install -g yarn

COPY package.json .
COPY yarn.lock .

RUN yarn

COPY . .

RUN ./node_modules/.bin/tsc

CMD ["npm", "start"]
