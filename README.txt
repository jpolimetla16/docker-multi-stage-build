docker ps
docker ps -a
docker rm -f hello-world
docker images
docker rmi hello-world
docker stop hello-world
docker start hello-world
docker exec -it hello-world bash

docker build -t hello-world --force-rm=true .
docker run -d --name hello-world -p 8181:8181 hello-world

spring boot slimmer images use jdep,jlink.