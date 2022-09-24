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
	out.js

out.js: | app.jsx
	npx --no esbuild $| --bundle --sourcemap --target=chrome58,firefox57,safari11,edge16 --outfile=$@

clean:
	rm -rf out.js
	rm -rf out.js.map

destroy:
	rm -rf node_modules
