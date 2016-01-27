IMAGENAME=jenkinsciinfra/mock-ldap
TAG=$(shell date '+%Y%m%d_%H%M%S')

image :
	docker build -t ${IMAGENAME} .

run :
	docker run -P --rm -i -t ${IMAGENAME}

tag :
	docker tag ${IMAGENAME} ${IMAGENAME}:${TAG}
