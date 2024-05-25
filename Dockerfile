FROM node
WORKDIR /app
VOLUME /app
COPY package*.json ./
RUN npm i
COPY . . 
CMD [ "npm","start" ]
