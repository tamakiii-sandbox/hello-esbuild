.PHONY: help build bash clean

IMAGE := hello-esbuild/golang

help:
	@cat $(firstword $(MAKEFILE_LIST))

build:
	docker build -t $(IMAGE) .

bash: build
	docker run -it --rm -v $(PWD):/work -w /work $(IMAGE) bash -l

clean:
	docker image rm $(IMAGE)
