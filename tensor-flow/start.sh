#!/usr/bin/env bash

docker rm $(docker ps -aq --filter "name=tensor")
#docker rmi $(docker images -q tensor:play)
docker build -t tensor:play .
docker run --name tensor -it -p 6006:6006 -v /tmp:/tmp tensor:play bash