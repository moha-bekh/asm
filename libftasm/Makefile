VOLUME=/Users/moha/Documents/dev/lang/asm/libftasm/shared
IMAGE=nasm-x86_64
CONTAINER=libasm

all: build run

run:
	@mkdir -p $(VOLUME)
	@docker run --name $(CONTAINER) \
		-ti --rm \
		-v $(VOLUME):/shared \
		--cap-add=SYS_PTRACE \
		--security-opt seccomp=unconfined \
		$(IMAGE) bash

build:
	@docker build --platform=linux/amd64 -t $(IMAGE) .

clean:
	@docker rm -f $(CONTAINER) || true

fclean: clean
	@docker rmi $(IMAGE) || true

info:
	@docker ps -a
	@docker images
	@docker volume ls
	@docker network ls

log:
	@docker logs -f $(CONTAINER)
