# node-automation
# Node Hello World

Simple node.js app that servers "hello world"

Great for testing simple deployments to the cloud
# Create Docker files
```
sudo nano docker-compose.yaml
```
### Add this in file 
```
version: "2"
services:
  webapp:
    ports:
      - "3001:3000"
    image: "node:app"
    tty: true
    container_name: "node1"
```
```
sudo nano Dockerfile
```
In docker file write this:
```
FROM node
WORKDIR /app
VOLUME /app
COPY package*.json ./
RUN npm i
COPY . . 
CMD [ "npm","start" ]
```
### Create `index.js` and add this in it.
```
const http = require('http');
const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  const msg = 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhHellow my cicd setup complete changes in index file to test cdi cdNode! qdhqwdh \n'
  res.end(msg);
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});
```
###  Create packages file 
```
nano package-lock.json
```
```
{
  "name": "papa-node-hello-000",
  "version": "1.0.0",
  "lockfileVersion": 1
}
```
```
nano package.json
```
```
{
  "name": "node-hello",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/johnpapa/node-hello.git"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/johnpapa/node-hello/issues"
  },
  "homepage": "https://github.com/johnpapa/node-hello#readme"
}
```

## Write script to run docker files
```
nano docker.sh
```
```
#! /bin/bash
docker-compose down 
docker rmi node:app
docker build -t node:app .
docker-compose up --remove-orphans --detach
```
### Run the script
```
./docker.sh
```

## Run It

`npm start`

### Check the server 
Open your browser and type :
```
localhost:3000
```

