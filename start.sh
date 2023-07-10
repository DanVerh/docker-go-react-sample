#!/bin/bash

# Build and start the Go backend
cd ./db
docker image build -t db-image --rm .
docker container run -d --name db db-image

# Build and start the Go backend
cd ../backend
docker image build -t backend-image --rm .
docker container run -d -p 8080:8080 --name backend backend-image

# Build and start the React on Nginx frontend
#cd ../frontend
#docker image build -t frontend-image --rm .
#docker container run -d -p 80:80 --name frontend frontend-image
#
#echo "Site is running on localhost:80"