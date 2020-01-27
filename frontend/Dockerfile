FROM node:latest
WORKDIR /usr/src/frontend-app
RUN rm -rf node_module
RUN rm -rf package-lock.json
RUN rm -rf yarn-lock.json
COPY package.json ./
RUN npm uninstall -g yarn
RUN npm cache clean -f

RUN npm install
COPY . .
EXPOSE 3000

CMD ["npm", "start"]