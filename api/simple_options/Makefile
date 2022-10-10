.PHONY: help install build clean uninstall
.PHONY: run

PATH := ./node_modules/.bin:$(PATH)

ESBUILD := npx --no -- esbuild
TSC := npx --no -- tsc

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	node_modules

node_modules:
	npm install

run:
	echo 'let x: number = 1' | esbuild --loader=ts
	echo 'let x: number = 1' | bin/mktemp -e .ts - | xargs -I@ tsc --noEmit @
	echo 'hooks = DEBUG && require("hooks")' | esbuild --define:DEBUG=true
	echo 'hooks = DEBUG && require("hooks")' | esbuild --define:DEBUG=false
	echo 'id, str' | esbuild --define:id=text --define:str=\"text\"
	echo 'console.log(process.env.NODE_ENV)' | esbuild --define:process.env.NODE_ENV="production"
	echo 'require("fsevents")' | esbuild --bundle --external:fsevents --platform=node
	echo 'alert("test")' | esbuild --format=iife
	echo 'export default "test"' | esbuild --format=cjs
	echo 'module.exports = "test"' | esbuild --format=esm

build: \
	dist/entry-points \
	dist/inject \
	dist/inject-with-define \
	dist/loader

dist/entry-points: dist | $(wildcard src/entry-points/*.ts)
	esbuild $| --bundle --outdir=$@
	tsc --emitDeclarationOnly --declaration --outDir $@ $|

dist/inject: dist | src/inject
	esbuild $|/entry.js --bundle --inject:$|/process-shim.js --outdir=$@ --format=cjs

dist/inject-with-define: dist | src/inject-with-define
	esbuild $|/entry.js --bundle --define:process.cwd=dummy_process_cwd --inject:$|/process-shim.js --outdir=$@ --format=cjs

dist/loader: dist | src/loader
	esbuild $|/app.js --bundle --loader:.png=dataurl --loader:.svg=text --outdir=$@

dist:
	mkdir $@

clean:
	rm -rf dist

uninstall:
	rm -rf node_modules
