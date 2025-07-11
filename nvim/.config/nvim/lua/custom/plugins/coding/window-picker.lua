return {
  'yorickpeterse/nvim-window',
  keys = {
    { '<leader>cn', "<cmd>lua require('nvim-window').pick()<cr>", desc = 'Pick a Window' },
    { '<leader>m', "<cmd>lua require('nvim-window').pick()<cr>", desc = 'Pick a Window' },
  },
  config = true,
}
