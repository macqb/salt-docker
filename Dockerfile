FROM debian:stable

MAINTAINER Bart van Raalte <bart.van.raalte@merapar.com>

COPY docker-entrypoint.sh /

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install \
		  salt-common \
      salt-master \
      salt-minion \
  		salt-ssh \
  		salt-cloud && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/

VOLUME ["/etc/salt/pki", \
        "/etc/salt/master.d", \
        "/etc/salt/cloud.conf.d", \
        "/etc/salt/cloud.profiles.d", \
        "/etc/salt/cloud.providers.d", \
        "/etc/salt/minion.d", \
        "/var/cache/salt", \
        "/var/logs/salt", \
        "/srv/salt"]

RUN chmod +x \
    /docker-entrypoint.sh

EXPOSE 4505 4506

CMD /docker-entrypoint.sh
