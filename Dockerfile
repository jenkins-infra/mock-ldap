FROM nickstenning/slapd

ENV LDAP_ROOTPASS s3cr3t
ENV LDAP_DOMAIN jenkins-ci.org
ENV LDAP_ORGANISATION MockJenkins

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ldap-utils

#ADD debconf-set-selections.conf /tmp/debconf-set-selections.conf
#RUN debconf-set-selections < /tmp/debconf-set-selections.conf
#RUN dpkg-reconfigure slapd
# base image expects this file and skips its own config
#RUN touch /var/lib/ldap/docker_bootstrapped

ADD data.ldif /tmp/data.ldif
RUN /etc/service/slapd/run & sleep 3; \
    ldapadd -H ldap:/// -x -D cn=admin,dc=jenkins-ci,dc=org -w s3cr3t < /tmp/data.ldif
# RUN /usr/sbin/slapadd -l /tmp/data.ldif
