.PHONY: help setup install info build clean destroy

help:
	@cat $(firstword $(MAKEFILE_LSIT))

setup:

install: \
	node_modules


info:
	npx --no esbuild --version

build: \
	out.js

out.js: | app.jsx
	npx --no esbuild $| --bundle --outfile=$@

node_modules:
	npm install

clean:
	rm -rf out.js

destroy:
	rm -rf node_modules
