return {
  'ThePrimeagen/vim-be-good',
  event = 'VeryLazy',
  cmd = { 'VimBeGood' },
  keys = {
    { '<leader>G', '<cmd>VimBeGood<cr>', desc = 'Vim Be Good' },
  },
  config = function()
    vim.g.vim_be_good_no_mappings = true
    vim.g.vim_be_good_no_quit = true
    vim.g.vim_be_good_no_exit = true
  end,
}
