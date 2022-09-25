.PHONE: help setup clean info build clean destory

help:
	@cat $(firstword $(MAKEFILE_LSIT))

setup:

install: \
	node_modules

node_modules:
	npm install --include=dev

info:
	npx --no esbuild --version

build: \
	dist/app.js \
	dist/app.bundle.js

dist/app.js: dist | app.jsx
	npx --no esbuild $| --bundle --sourcemap --target=chrome58,firefox57,safari11,edge16 --outfile=$@

dist/app.bundle.js: dist | app.jsx
	npx --no esbuild $| --bundle --sourcemap --platform=node --target=node10.4 --outfile=$@

dist:
	mkdir $@

clean:
	rm -rf dist

destroy:
	rm -rf node_modules
