RIPPLED_VER := 1.2.2
PORT := 15005
NETWORK := testnet
CONTAINER_NAME := rippled_$(NETWORK)_01

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
