RIPPLED_VER := 1.2.2
PORT := 15005
NETWORK := testnet
CONTAINER_NAME := rippled_$(NETWORK)_01

.PHONY: build
build: build_rippled build_ripple_lib

.PHONY: build_rippled
build_rippled:
	docker build rippled \
		--build-arg rippled_ver=$(RIPPLED_VER) \
		--build-arg network=$(NETWORK) \
		-t rippled_$(NETWORK):$(RIPPLED_VER) \
		-t rippled_$(NETWORK):latest

.PHONY: build_ripple_lib
build_ripple_lib:
	docker build ripple-lib \
		-t ripple_lib:latest

.PHONY: run_ripple_lib
run_ripple_lib:
	docker run \
		-d \
		--rm \
		--name ripple_lib_01 \
		-p 50080:80 \
		-v $(shell pwd)/ripple-lib/files:/home/ripple-lib \
		ripple_lib:latest

.PHONY: run
run:
	docker run \
		-d \
		--name $(CONTAINER_NAME) \
		-p $(PORT):5005 \
		rippled_$(NETWORK):$(RIPPLED_VER)

.PHONY: rerun
rerun:
	docker start $(CONTAINER_NAME)

.PHONY: login
login:
	docker exec -it $(CONTAINER_NAME) /bin/bash

.PHONY: rm
rm:
	docker stop $(CONTAINER_NAME) && \
	docker rm $(CONTAINER_NAME)

.PHONY: clean
clean:
	$(MAKE) rm
	docker rmi rippled_$(NETWORK):$(RIPPLED_VER)
	docker rmi rippled_$(NETWORK):latest
