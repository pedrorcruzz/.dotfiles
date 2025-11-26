return {
  {
    'vim-test/vim-test',
    cmd = {
      'TestNearest',
      'TestFile',
      'TestSuite',
      'TestLast',
      'TestVisit',
      'TestClass',
    },
    keys = {
      { '<leader>nn', '<cmd>TestNearest<CR>', desc = 'Vimtest: run nearest test' },
      { '<leader>nf', '<cmd>TestFile<CR>', desc = 'Vimtest: run file tests' },
      { '<leader>nl', '<cmd>TestLast<CR>', desc = 'Vimtest: run last test' },

      -- { '<leader>Ns', '<cmd>TestSuite<CR>', desc = 'Vimtest: run full test suite' },
      -- { '<leader>Nv', '<cmd>TestVisit<CR>', desc = 'Vimtest: visit last test file' },
      -- { '<leader>Nc', '<cmd>TestClass<CR>', desc = 'Vimtest: run test class (pytest)' },
      -- { '<leader>NF', '<cmd>TestFile -strategy=neovim<CR>', desc = 'Vimtest: run file (neovim term)' },
      -- { '<leader>NS', '<cmd>TestSuite -strategy=neovim<CR>', desc = 'Vimtest: run suite (neovim term)' },
    },
    init = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#neovim#start_normal'] = 1
      vim.g['test#neovim#term_position'] = 'belowright'

      vim.g['test#go#runner'] = 'gotest'
      vim.g['test#go#gotest#options'] = {
        nearest = '-v',
        file = '-v',
        suite = '-v',
      }

      -- vim.g['test#python#runner'] = 'pytest'
      -- vim.g['test#python#pytest#options'] = {
      --   nearest = '-v',
      --   file = '-v',
      --   suite = '-v',
      -- }

      -- vim.g['test#javascript#runner'] = 'jest'
      -- vim.g['test#javascript#jest#options'] = {
      --   nearest = '--verbose',
      --   file = '--verbose',
      --   suite = '--verbose',
      -- }

      -- vim.g['test#ruby#runner'] = 'rspec'
      -- vim.g['test#ruby#rspec#options'] = {
      --   nearest = '--format documentation',
      --   file = '--format documentation',
      --   suite = '--format documentation',
      -- }

      -- vim.g['test#elixir#runner'] = 'exunit'
      -- vim.g['test#elixir#exunit#options'] = {
      --   nearest = '--trace',
      --   file = '--trace',
      --   suite = '--trace',
      -- }

      ---------------------------------------------------------------------------

      if vim.fn.has 'nvim' == 1 then
        vim.keymap.set('t', '<C-o>', [[<C-\><C-n>]], { desc = 'Terminal: exit to Normal mode' })
      end
    end,
  },
}
