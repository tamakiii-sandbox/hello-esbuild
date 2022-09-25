import * as React from 'react';
import * as Server from 'react-dom/server';

interface FakeOnResolveOptions {
  filter: RegExp;
  namespace?: string;
};

interface Props {
  // comp: React.ElementType;
}

const Greet: React.FunctionComponent<Props> = (props) => {
  console.log(props);
  return (
    <h1>Hello World</h1>
  );
}

console.log(Server.renderToString(<Greet />))

export {
  FakeOnResolveOptions,
  Props
}
