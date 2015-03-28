FROM nickstenning/slapd

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ldap-utils
