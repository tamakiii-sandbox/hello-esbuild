.PHONY: help setup install info build clean destroy

help:
	@cat $(firstword $(MAKEFILE_LSIT))

setup:

install:


info:
	npx --no esbuild --version

build:

clean:

destroy:
	rm -rf node_modules
