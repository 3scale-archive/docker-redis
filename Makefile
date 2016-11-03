IMAGE_NAME ?= redis

build:
	docker build --pull -t $(IMAGE_NAME) .

start:
	docker run --rm --user 10002 -p 6379:6379 $(IMAGE_NAME)

test:
	docker run --rm --user 10002 $(IMAGE_NAME) --daemonize yes
