.PHONY: help install build clean uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	node_modules

build: \
	out.js

node_modules:
	npm install

out.js: | app.jsx
	npx --no esbuild $| --bundle --minify --sourcemap --target=chrome58,firefox57,safari11,edge16 --outfile=$@

clean:
	-rm out.js

uninstall:
	-rm -rf node_modules
