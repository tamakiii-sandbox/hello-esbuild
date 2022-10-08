.PHONY: help install build clean uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	node_modules

node_modules:
	npm install

build: \
	dist/javascript.js

dist/javascript.js: dist | javascript.js
	npx --no esbuild $| --bundle --platform=browser --target=chrome58,firefox57,safari11,edge16 --outfile=$@

dist:
	mkdir $@

clean:
	rm -rf dist

uninstall:
	rm -rf node_modules
