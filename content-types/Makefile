.PHONY: help install build check clean uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	node_modules

node_modules:
	npm install

build: \
	dist/javascript.js \
	dist/typescript.js \
	dist/typescript.d.ts \
	dist/jsx.js \
	dist/json.js \
	dist/css.js \
	dist/css.html

check:
	npx --no -- tsc --noEmit typescript.ts

dist/javascript.js: dist | javascript.js
	npx --no -- esbuild $| --bundle --platform=browser --target=chrome58,firefox57,safari11,edge16 --outfile=$@

dist/typescript.js: dist | typescript.ts
	npx --no -- esbuild $| --bundle --platform=browser --target=chrome58,firefox57,safari11,edge16 --loader:.ts=ts --outfile=$@

dist/typescript.d.ts: dist | typescript.ts
	npx --no -- tsc --emitDeclarationOnly --declaration --outFile $@ $|

dist/jsx.js: dist | jsx.jsx
	npx --no -- esbuild $| --bundle --platform=browser --target=chrome58,firefox57,safari11,edge16 --loader:.jsx=jsx --outfile=$@

dist/json.js: dist | json.js
	npx --no -- esbuild $| --bundle --outfile=$@

dist/css.js: dist | css.jsx
	npx --no -- esbuild $| --bundle --outfile=$@ --jsx=automatic --format=esm

dist/css.html: dist | css.html
	cp $| $@

dist:
	mkdir $@

clean:
	rm -rf dist

uninstall:
	rm -rf node_modules
