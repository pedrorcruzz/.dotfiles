local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('typescript', {
  s({ trig = 'hello', dscr = 'Log hello world' }, t "console.log('hello world')"),
})
