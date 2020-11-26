#!bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io -y

docker run -d -p 8080:80 nginx
docker run -d -p 9090:80 httpd
docker run -d -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password -p 27017:27017 --name mongo-nginx --hostname mongo mongo
docker run -d -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password -p 27018:27017 --name mongo-apache --hostname mongo mongo
sleep 20
docker run -d -e ME_CONFIG_MONGODB_SERVER=mongo -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password -p 8081:8081 --link mongo-nginx --name mongo-express-nginx mongo-express
docker run -d -e ME_CONFIG_MONGODB_SERVER=mongo -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password -p 8082:8081 --link mongo-apache --name mongo-express-apache mongo-express