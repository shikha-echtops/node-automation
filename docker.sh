#! /bin/bash
docker-compose down 
docker rmi node:app
docker build -t node:app .
docker-compose up --remove-orphans --detach

