.PHONY: help setup install info build clean destroy

help:
	@cat $(firstword $(MAKEFILE_LSIT))

setup:

install: \
	node_modules

node_modules:
	npm install

info:
	npx --no esbuild --version

build: \
	out.js

out.js: | app.jsx
	npx --no esbuild $| --bundle --minify --target=chrome58,firefox57,safari11,edge16 --outfile=$@

bundle: | app.jsx
	npx --no esbuild $| --bundle --platform=node --target=node10.4 --outfile=$@

clean:
	rm -rf out.js
	rm -rf bundle

destroy:
	rm -rf node_modules
