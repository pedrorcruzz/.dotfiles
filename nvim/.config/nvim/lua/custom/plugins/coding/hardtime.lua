local hardtime_enabled = true

return {
  'm4xshen/hardtime.nvim',
  event = 'VeryLazy',
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    enabled = hardtime_enabled,
    disabled_keys = {
      ['<Up>'] = {},
      ['<Down>'] = {},
      ['<Left>'] = {},
      ['<Right>'] = {},
    },
  },
  keys = {
    {
      '<leader>lh',
      '<cmd>Hardtime toggle<CR>',
      desc = 'Toggle Hardtime',
    },
  },
}
