.PHONY: help install build clean uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	node_modules

build: \
	out.js \
	out.node.js

node_modules:
	npm install

out.js: | app.jsx
	npx --no esbuild $| --bundle --outfile=$@

out.node.js: | app.jsx
	npx --no esbuild $| --bundle --outfile=$@ --platform=node --target=node10.4 --external:./node_modules/*

clean:
	-rm out.js
	-rm out.node.js

uninstall:
	-rm -rf node_modules
