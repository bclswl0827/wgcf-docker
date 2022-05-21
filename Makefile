.PHONY: build

build:
	docker build -t wgcf:latest --build-arg ARCH=$(uname -m) .
