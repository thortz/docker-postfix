FROM thortz/docker-xenial

# Setup noninteractive instllation for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# ADD template folder on docker
ADD app /app/
RUN chmod +x /app/startup.sh

# Logging Installation
RUN apt-get update \
	&& apt-get install -y -q syslog-ng logrotate

# Loggin fix startup

RUN sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf
RUN sed -i 's/^#\(SYSLOGNG_OPTS="--no-caps"\)/\1/g' /etc/default/syslog-ng

# Preconf for setup posfix

RUN echo "postfix postfix/main_mailer_type string Internet site" > setuppostfix.txt
RUN echo "postfix postfix/mailname string smtp.my.domain" >> setuppostfix.txt
RUN debconf-set-selections setuppostfix.txt
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q postfix

EXPOSE 25

ENTRYPOINT ["/app/startup.sh"]

