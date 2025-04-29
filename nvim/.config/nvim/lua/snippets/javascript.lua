local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('javascript', {
  s({ trig = 'afn', dscr = 'Arrow Function' }, fmt 'const ${1:name} = (${2:args}) => {\n  ${3}\n}'),
})

ls.add_snippets('javascript', {
  s(
    { trig = 'tryc', dscr = 'Try Catch' },
    fmt [[try {
  ${1}
} catch (error) {
  console.error(error)
}]]
  ),
})
