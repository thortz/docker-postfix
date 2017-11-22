#!/bin/bash
#

sudo docker run -v /home/postfix/logs/:/var/log/ --mount source=docker-smtp-spool,target=/var/spool/postfix -itd -p 25:25 docker-smtp postfix
