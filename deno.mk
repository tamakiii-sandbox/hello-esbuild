.PHONY: help install build clean uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

install:
	@echo "nothing to do"

build: \
	out.deno.js

out.deno.js: out.deno.json
	cat $< | jq -r '.code' > $@

out.deno.json: | deno.js
	deno run --allow-read --allow-env --allow-run $| | jq > $@

clean:
	-rm out.deno.js
	-rm out.deno.json

uninstall:
	@echo "nothing to do"
