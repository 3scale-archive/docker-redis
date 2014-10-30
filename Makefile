REPO=redis
REGISTRY:=quay.io/3scale
TAG:=$(shell git rev-parse --abbrev-ref HEAD)
IMAGE:=$(REGISTRY)/$(REPO):$(TAG)

build:
	docker build --tag $(IMAGE) $(shell pwd)
bash:
	docker run --rm -t -i --entrypoint=/bin/bash $(IMAGE)
start:
	docker run --rm $(IMAGE)
