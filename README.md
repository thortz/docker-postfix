# docker-postix

- /app/mailname 	= postfix domain
- /app/main.cf 		= main configuration for postfix 
- /app/master.cf 	= rules for messaage
- /app/mynetwork 	= IP whitelist
- /app/starup.sh 	= docker launch script

## Configuration
- Edit : /app/mailname with your Domaine Name
- Edit : main.cf "myhostname = smtp.my.domain.local"
- Add your IP to /app/mynetwork

## BUILD
- sudo docker volume create docker-smtp-spool
- sudo docker build -t docker-smtp .

## START DOCKER
- sudo docker run -v /home/postfix/logs/:/var/log/ --mount source=docker-smtp-spool,target=/var/spool/postfix -itd -p 25:25 docker-smtp postfix

## LOGGING
- On host folder : /home/postfix/logs/
