return {
  'rmagatti/goto-preview',
  dependencies = { 'rmagatti/logger.nvim' },
  event = 'BufEnter',
  config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  vim.keymap.set('n', 'gp', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>,", { noremap = true }),
  vim.keymap.set('n', 'gP', "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true }),
}
