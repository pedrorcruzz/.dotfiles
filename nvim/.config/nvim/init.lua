require 'config.keybinds'
require 'config.autocmds'
require 'config.options'
require 'config.filetypes'
require 'lsp.lsp-handlers'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  { import = 'custom.plugins.env.lsp' },
  { import = 'custom.plugins.env' },
  { import = 'custom.plugins.language' },
  { import = 'custom.plugins.ui' },
  { import = 'custom.plugins.ui.colorschemes' },
  { import = 'custom.plugins.coding' },
  { import = 'custom.plugins.editor' },
  { import = 'custom.plugins.ai' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
