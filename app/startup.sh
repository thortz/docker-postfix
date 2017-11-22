#!/bin/bash
#

set -e

if [ "$1" = 'postfix' ]; then

	# Remove default conf
	rm -rf /etc/postfix/master.cf
	rm -rf /etc/postfix/main.cf
	rm -rf /etc/mailname

	# Symlink file configuration
	ln -s /app/main.cf /etc/postfix/main.cf
	ln -s /app/master.cf /etc/postfix/master.cf
	ln -s /app/mynetwork /etc/postfix/mynetwork
	ln -s /app/mailname /etc/mailname

	# Start service
	/etc/init.d/syslog-ng restart
	/etc/init.d/postfix restart

	#Show mail.log on console
	tail -f /var/log/mail.log
fi
