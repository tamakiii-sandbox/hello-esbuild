import * as React from 'react'
import { createRoot } from 'react-dom/client';
import './button.css'

class Button extends React.Component {
  render() {
    return <button className="button">{this.props.children}</button>;
  }
}

const render = (container) => {
  const root = createRoot(container);
  root.render(<Button>Please click me</Button>);
}

export {
  Button,
  render,
}
