CONTAINER_NAME := ripple_lib_01

.PHONY: init
init:
	cp default.env .env

.PHONY: build
build:
	docker-compose build --parallel

.PHONY: run
run:
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose stop

.PHONY: login
login:
	docker exec -it $(CONTAINER_NAME) /bin/bash

.PHONY: down
down:
	docker-compose down

.PHONY: clean
clean:
	docker-compose down --rmi all
