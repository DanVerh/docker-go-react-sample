#!/bin/bash

# Create a separate network for the application
docker network create --subnet 172.18.0.1/29 --driver bridge app-network
echo "Network for the app is created"

# Build and start the PostgreSQL DB
cd ./db
docker image build -t db-image --rm .
docker container run -d --name db --network app-network --ip 172.18.0.2 db-image
cd ..
echo "DB container is up an running"

# Build and start the Go backend
cd ./backend
docker image build -t backend-image --rm .
docker container run -d -p 8080:8080 --network app-network --name backend backend-image
docker container logs backend 
cd ..
echo "Backend container is up an running"

# Build and start the React on Nginx frontend
cd ./frontend
docker image build -t frontend-image --rm .
docker container run -d -p 80:80 --network app-network --name frontend frontend-image
cd ..

echo "Frontend is running on localhost:80"