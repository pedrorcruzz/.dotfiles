return {
  'rmagatti/goto-preview',
  lazy = true,
  event = 'BufEnter',
  dependencies = { 'rmagatti/logger.nvim' },
  config = function()
    local gp = require 'goto-preview'
    vim.keymap.set('n', 'gp', gp.goto_preview_definition, { noremap = true, desc = 'Preview Definition' })
    vim.keymap.set('n', 'gP', gp.close_all_win, { noremap = true, desc = 'Close All Preview Windows' })
    -- vim.keymap.set('n', 'gpt', gp.goto_preview_type_definition, { noremap = true })
    -- vim.keymap.set('n', 'gpi', gp.goto_preview_implementation, { noremap = true })
    -- vim.keymap.set('n', 'gpD', gp.goto_preview_declaration, { noremap = true })
    -- vim.keymap.set('n', 'gpr', gp.goto_preview_references, { noremap = true })
  end,
}
