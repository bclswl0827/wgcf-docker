.PHONY: build
OS_ARCH = $(shell uname -m)

build:
	echo $(OS_ARCH)
	docker build -t wgcf:latest --build-arg ARCH=$(OS_ARCH) .
