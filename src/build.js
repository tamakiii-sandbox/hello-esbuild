const { build } = require('esbuild')
const glob = require('glob')
const entryPoints = glob.sync('./src/**/*.tsx')

console.log(entryPoints)

const result = build({
  entryPoints,
  outbase: './src',
  outdir: './dist',
  platform: 'node',
  external: [],
  watch: false
})
  .then((value, reason) => console.log(value, reason))

