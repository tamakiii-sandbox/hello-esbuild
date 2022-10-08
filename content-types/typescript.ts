interface Foo {
  vaa: string
}

function hoge(foo: Foo) {
  return `!!!${foo.vaa}!!!`;
}

console.log(hoge({vaa: 'VAA'}))

export {
  Foo
}
