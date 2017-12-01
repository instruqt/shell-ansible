.PHONY: package deploy
DOCKER_IMAGE=gcr.io/instruqt/shell-ansible
GIT_COMMITS=$(shell git rev-list --count HEAD)
GIT_HASH=$(shell git rev-parse --short HEAD)
VERSION=$(GIT_COMMITS)-$(GIT_HASH)

package:
	docker build -t $(DOCKER_IMAGE):$(VERSION) .

publish:
	docker push $(DOCKER_IMAGE):$(VERSION)
	docker tag $(DOCKER_IMAGE):$(VERSION) $(DOCKER_IMAGE):latest
	docker push $(DOCKER_IMAGE):latest
