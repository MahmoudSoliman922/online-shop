FROM node:latest
WORKDIR /usr/src/frontend-app
RUN rm -R node_module
RUN rm -R package-lock.json
RUN rm -R yarn-lock.json
COPY package.json ./
RUN npm uninstall -g yarn
RUN npm cache clean -f

RUN npm install
COPY . .
EXPOSE 3000

CMD ["npm", "start"]