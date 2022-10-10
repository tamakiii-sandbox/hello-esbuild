.PHONY: help build bash clean

IMAGE := hello-esbuild/api/transform

help:
	@cat $(firstword $(MAKEFILE_LIST))

build:
	docker build -t $(IMAGE) .

bash:
	docker run -it --rm -v $(PWD):/work -w /work $(IMAGE) $@

clean:
	docker image rm $(IMAGE)
