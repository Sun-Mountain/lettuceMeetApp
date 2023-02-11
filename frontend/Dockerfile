FROM node:14.18-alpine

WORKDIR /frontend

COPY package*.json ./

RUN yarn install

COPY ./ .

CMD ["yarn", "run", "dev", "--", "--host", "0.0.0.0"]
