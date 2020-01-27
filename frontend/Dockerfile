FROM node:latest

RUN mkdir /frontend
WORKDIR /frontend

COPY package.json ./
RUN rm -rf node_modules
RUN rm -rf package-lock.json
RUN npm install

ADD . /frontend
