#!/bin/sh
White='\033[1;36m'
NC='\033[0m' # No Color

case "$1" in

    "dep" )
        docker run --name myjenkins -p 8080:8080 -p 50000:50000 -u root -v $(which docker):/usr/bin/docker -v $PWD/jenkins:/var/jenkins_home -d -v /var/run/docker.sock:/var/run/docker.sock jenkins
        ;;
    * )
        echo "${White}dep${NC}: deploy jenkins"

esac
