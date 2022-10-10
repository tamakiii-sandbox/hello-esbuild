import * as React from 'react'
import { createRoot } from 'react-dom/client';
import './button.css'

const Button = React.createElement(
  'button',
  {
    'className': 'button'
  },
  [
    "Click me"
  ]
)

export {
  Button,
  createRoot,
}
