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
      { '<leader>Nn', '<cmd>TestNearest<CR>', desc = 'Vimtest: run nearest test' },
      { '<leader>Nf', '<cmd>TestFile<CR>', desc = 'Vimtest: run file tests' },
      { '<leader>Nl', '<cmd>TestLast<CR>', desc = 'Vimtest: run last test' },

      -- { '<leader>Ns', '<cmd>TestSuite<CR>', desc = 'Vim-test: run full test suite' },
      -- { '<leader>Nv', '<cmd>TestVisit<CR>', desc = 'Vim-test: visit last test file' },
      -- { '<leader>Nc', '<cmd>TestClass<CR>', desc = 'Vim-test: run test class (pytest)' },
      -- { '<leader>NF', '<cmd>TestFile -strategy=neovim<CR>', desc = 'Vim-test: run file (neovim term)' },
      -- { '<leader>NS', '<cmd>TestSuite -strategy=neovim<CR>', desc = 'Vim-test: run suite (neovim term)' },
    },
    init = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#neovim#start_normal'] = 1
      vim.g['test#neovim#term_position'] = 'belowright'

      if vim.fn.has 'nvim' == 1 then
        vim.keymap.set('t', '<C-o>', [[<C-\><C-n>]], { desc = 'Terminal: exit to Normal mode' })
      end
    end,
  },
}
