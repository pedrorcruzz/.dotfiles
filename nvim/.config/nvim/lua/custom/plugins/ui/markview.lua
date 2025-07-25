return {
  'OXY2DEV/markview.nvim',
  lazy = true,
  ft = { 'markdown' },
  cmd = { 'MarkviewToggle', 'MarkviewOpen', 'MarkviewClose' },
  keys = {
    { '<leader>ut', '<cmd>MarkviewToggle<cr>', desc = 'Markview: Toggle' },
  },
}
