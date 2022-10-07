.PHONE: help setup clean info build clean destory

ESBUILD := npx --no esbuild
DEBUG := false

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
	dist/app.d.ts \
	dist/app.js \
	dist/app.bundle.js

dist/app.d.ts: dist | src/app.tsx

dist/app.js: dist | src/app.tsx
	$(ESBUILD) $| --loader:.tsx=tsx --define:DEBUG=$(DEBUG) --sourcemap --target=chrome58,firefox57,safari11,edge16 --outfile=$@

dist/app.bundle.js: dist | src/app.tsx
	$(ESBUILD) $| --loader:.tsx=tsx --define:DEBUG=$(DEBUG) --bundle --sourcemap --platform=node --target=node10.4 --outfile=$@

dist/app.d.ts: dist | src/app.tsx
	npx --no tsc $| --jsx react --declaration --emitDeclarationOnly --outFile $@

dist:
	mkdir $@

clean:
	rm -rf dist

destroy:
	rm -rf node_modules
