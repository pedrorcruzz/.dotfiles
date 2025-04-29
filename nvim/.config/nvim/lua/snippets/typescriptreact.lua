local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('typescriptreact', {
  s(
    { trig = 'edf', dscr = 'Export Default Function - React TSX Component' },
    fmt(
      [[
export default function {}({}: {}): JSX.Element {{
  return (
    <div>
      {}
    </div>
  )
}}
    ]],
      { t 'Name', t 'props', t 'PropsType', t '/* content */' }
    )
  ),
})

ls.add_snippets('typescriptreact', {
  s(
    { trig = 'ef', dscr = 'Export Function - React TSX Component' },
    fmt(
      [[
export function {}({}: {}): JSX.Element {{
  return (
    <div>
      {}
    </div>
  )
}}
    ]],
      { t 'Name', t 'props', t 'PropsType', t '/* content */' }
    )
  ),
})
