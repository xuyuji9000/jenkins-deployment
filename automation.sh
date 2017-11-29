#!/bin/sh

# load environment variables
. ./.env

White='\033[1;36m'
NC='\033[0m' # No Color


case "$1" in

    "dep" )
        docker run --name myjenkins -p 8080:8080 -p 50000:50000 -u root -v $(which docker):/usr/bin/docker -v $PWD/jenkins:/var/jenkins_home -d -v /var/run/docker.sock:/var/run/docker.sock jenkins
        ;;
    "backup" ) # backup ./jenkins content 
        tar czf $JENKINS_BACKUP_PATH/$(date +'%Y-%b-%d-%H-%M-%S')_jenkins.tar.gz ./jenkins
        find $JENKINS_BACKUP_PATH -mindepth 1 -mtime +7 -exec rm {} \;
        ;;
    * )
        echo "${White}dep${NC}: deploy jenkins"
        echo "${White}backup${NC}: backup jenkins"

esac
