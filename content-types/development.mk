.PHONY: help install server clean uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	node_modules

server: | dist
	npx --no -- http-server $|

node_modules:
	npm install --dev

clear:

uninstall:
	rm -rf node_modules
