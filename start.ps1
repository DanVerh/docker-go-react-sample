# Build and start the Go backend
#cd ./db
#docker image build -t db-image --rm .
#docker container run -d -p 5432:5432 --name db db-image

# Build and start the Go backend
cd ./backend
docker image build -t backend-image --rm .
docker container run -d -p 8080:8080 --name backend backend-image