.PHONY: help install clean uninstall
.PHONY: run

ESBUILD := npx --no -- esbuild
TSC := npx --no -- tsc

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	node_modules

node_modules:
	npm install

run:
	echo 'let x: number = 1' | $(ESBUILD) --loader=ts
	echo 'let x: string = 1' | bin/mktemp -e .ts - | xargs -I@ npx --no -- tsc --noEmit @

clean:
	rm -rf dist

uninstall:
	rm -rf node_modules
