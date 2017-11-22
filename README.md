# docker-postix

- /app/mailname 	= postfix domain
- /app/main.cf 		= main configuration for postfix 
- /app/master.cf 	= rules for messaage
- /app/mynetwork 	= IP whitelist
- /app/starup.sh 	= docker launch script

## BUILD
- sudo docker volume create docker-smtp-spool
- sudo docker build -t docker-smtp .

## START DOCKER
- sudo docker run -v /home/postfix/logs/:/var/log/ --mount source=docker-smtp-spool,target=/var/spool/postfix -itd -p 25:25 docker-smtp postfix

## LOGGING
- On host folder : /home/postfix/logs/
