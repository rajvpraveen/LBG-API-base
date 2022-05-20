#!/bin/bash

DOCKERHUB_USER=rajvpraveen
APP_NAME=lbg-api-app
docker rmi -f ${DOCKERHUB_USER}/${APP_NAME}

# build image

docker build -t ${DOCKERHUB_USER}/${APP_NAME} . 

# push to dockerhub
docker push ${DOCKERHUB_USER}/${APP_NAME}

# run container from image
docker rm -f ${APP_NAME}
docker run -d  --name lbg-api-app -p 80:4000 ${APP_NAME} ${DOCKERHUB_USER}/${APP_NAME}

docker system prune -f
