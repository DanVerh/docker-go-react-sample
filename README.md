# Description
This repository contains simple dockerized Go and React application

# Technologies 
- Docker
- Go
- React
- Nginx
- Bash

# Docker best-practices
My goal was to create a sample application where I could implement all Docker best-practices, specifically:
1. Using multi-stage builds
2. The least amount of layers
3. Removing intermediate containers during the build
4. Pulling alpine and scratch images
5. Start container with ENTRYPOINT to disable overriding the command

# Start the app
Have the docker on your sytem up and running <br>
Just execute in root directory `./start.sh` <br>
This script is building images and starting the containers