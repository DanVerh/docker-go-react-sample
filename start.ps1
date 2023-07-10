# Create a separate network for the application
#docker network create --subnet 172.18.0.1/29 --driver bridge app-network

# Build and start the PostgreSQL DB
#cd ./db
#docker image build -t db-image --rm .
#docker container run -d --name db --network app-network --ip 172.18.0.2 db-image

# Build and start the Go backend
docker container rm backend -f
cd ./backend
docker image build -t backend-image --rm .
docker container run -d -p 8080:8080 --network app-network --name backend backend-image
docker container logs backend 
cd ..