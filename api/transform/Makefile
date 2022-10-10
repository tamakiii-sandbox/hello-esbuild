.PHONY: help install clean uninstall
.PHONY: run

SHELL := zsh

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
	echo 'let x: number = 1' | { read STDIN; npx --no -- tsc --noEmit `(){ mv $$1 $$1.ts && echo $$_ } =(echo $$STDIN)` }

clean:
	rm -rf dist

uninstall:
	rm -rf node_modules
