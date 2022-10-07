import * as esbuild from 'https://deno.land/x/esbuild@v0.15.10/mod.js'
const ts = 'let test: boolean = true'
const result = await esbuild.transform(ts, { loader: 'ts' })
console.log(JSON.stringify(result))
esbuild.stop()
