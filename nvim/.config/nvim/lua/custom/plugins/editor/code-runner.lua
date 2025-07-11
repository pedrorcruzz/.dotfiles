return {
  'neysanfoo/coderunner.nvim',
  lazy = true,
  cmd = { 'Run' },
  keys = {
    { '<leader>lc', '<cmd>Run<cr>', desc = 'Code: Run' },
  },
  config = function()
    require('coderunner').setup {
      filetype_commands = {
        python = 'python3 -u "$fullFilePath"',
        lua = 'lua',
        c = { 'gcc "$fullFilePath" -o "$dir/out"', '"$dir/./out"' },
        cpp = { 'g++ "$fullFilePath" -o "$dir/out"', '"$dir/./out"' },
        java = { 'javac "$fullFilePath"', 'java -cp ".:$dir" "$fileNameWithoutExt"' },
        javascript = 'node "$fullFilePath"',
        typescript = 'bun "$fullFilePath"',
        go = 'go run "$fullFilePath"',
        elixir = 'elixir "$fullFilePath"',
        php = 'php "$fullFilePath"',
      },
      buffer_height = 20,
      focus_back = false,
    }
  end,
}
