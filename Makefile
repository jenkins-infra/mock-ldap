IMAGENAME=jenkinsciinfra/mock-ldap
TAG=$(shell date '+%Y%m%d_%H%M%S')

image :
	docker build -t ${IMAGENAME} .

run :
	docker run -P -p 389:389 --rm -i -t ${IMAGENAME}

setup-ldap:
	ldapadd -h localhost -p 389 -c -x -D cn=admin,dc=jenkins-ci,dc=org -f data.ldif -w s3cr3t

tag :
	docker tag ${IMAGENAME} ${IMAGENAME}:${TAG}
