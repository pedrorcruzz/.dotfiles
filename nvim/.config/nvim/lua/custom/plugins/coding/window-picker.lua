return {
  'yorickpeterse/nvim-window',
  keys = {
    { '<leader>cf', "<cmd>lua require('nvim-window').pick()<cr>", desc = 'Pick a Window' },
  },
  config = true,
}
