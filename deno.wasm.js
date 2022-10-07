// **Why this is not recommended**: Deno is newer than node, less widely used, and supports fewer platforms than node, so node is recommended as the primary way to run esbuild. Deno also uses the internet as a package system instead of existing JavaScript package ecosystems, and esbuild is designed around and optimized for npm-style package management. You should still be able to use esbuild with Deno, but you will need a plugin if you would like to be able to bundle HTTP URLs.

import * as esbuild from 'https://deno.land/x/esbuild@v0.15.10/wasm.js'
const ts = 'let test: boolean = true'
const result = await esbuild.transform(ts, { loader: 'ts' })
console.log(JSON.stringify(result))
Deno.exit(0) // You may want to manually call Deno.exit(0) after your code is done if you are writing a short-lived script that uses esbuild's WebAssembly implementation so that your code exits in a reasonable timeframe.
