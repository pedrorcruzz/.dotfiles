return {
  'yorickpeterse/nvim-window',
  keys = {
    { '<leader>mf', "<cmd>lua require('nvim-window').pick()<cr>", desc = 'Pick a Window' },
  },
  config = true,
}
