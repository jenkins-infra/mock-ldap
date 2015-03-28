FROM nickstenning/slapd

ENV LDAP_ROOTPASS s3cr3t
ENV LDAP_DOMAIN jenkins-ci.org
ENV LDAP_ORGANISATION MockJenkins

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ldap-utils

ADD data.ldif /tmp/data.ldif
RUN /etc/service/slapd/run & sleep 3; \
    ldapadd -H ldap:/// -x -D cn=admin,dc=jenkins-ci,dc=org -w s3cr3t < /tmp/data.ldif
