FROM nickstenning/slapd

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ldap-utils

ADD data.ldif /tmp/data.ldif
RUN /usr/sbin/slapadd -f /tmp/data.ldif