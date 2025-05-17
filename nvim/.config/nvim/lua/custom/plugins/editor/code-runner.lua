return {
  'neysanfoo/coderunner.nvim',
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
      buffer_height = 20, -- height in lines
      focus_back = false, -- whether to set the cursor back to the original window after running the code
    }
  end,
  keys = {
    { '<leader>lc', '<cmd>Run<cr>', desc = ' Code: Run' },
  },
}
