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
	dist/app.js \
	dist/app.bundle.js

dist/app.js: dist | src/app.tsx
	npx --no esbuild $| --loader:.tsx=tsx --minify --target=chrome58,firefox57,safari11,edge16 --outfile=$@

dist/app.bundle.js: dist | src/app.tsx
	npx --no esbuild $| --loader:.tsx=tsx --bundle --minify --platform=node --target=node10.4 --outfile=$@

dist:
	mkdir $@

clean:
	rm -rf dist

destroy:
	rm -rf node_modules
