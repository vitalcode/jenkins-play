#!/usr/bin/env bash

docker-compose down
docker rm $(docker ps -qa)
docker rmi jenkins-play_jenkins
docker volume rm jenkins-play_jenkins_home
