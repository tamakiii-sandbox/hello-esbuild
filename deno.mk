.PHONY: help install build clean uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

install:
	@echo "nothing to do"

build: \
	out.deno.js \
	out.deno.wasm.js

out.deno.js: out.deno.json
	cat $< | jq -r '.code' > $@

out.deno.json: | deno.js
	deno run --allow-net --allow-read --allow-env --allow-run $| | jq > $@

out.deno.wasm.js: out.deno.wasm.json
	cat $< | jq -r '.code' > $@

out.deno.wasm.json: | deno.wasm.js
	deno run --allow-net --allow-read --allow-env --allow-run $| | jq > $@


clean:
	-rm out.deno.js
	-rm out.deno.json
	-rm out.deno.wasm.js
	-rm out.deno.wasm.json

uninstall:
	@echo "nothing to do"
