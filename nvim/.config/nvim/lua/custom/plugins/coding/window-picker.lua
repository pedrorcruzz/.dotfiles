return {
  'yorickpeterse/nvim-window',
  keys = {
    { '<leader>m', "<cmd>lua require('nvim-window').pick()<cr>", desc = 'Pick a Window' },
  },
  config = true,
}
