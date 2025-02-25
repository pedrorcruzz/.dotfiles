-- Require
require 'config.keybinds'
require 'config.autocmds'
require 'config.options'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  { import = 'custom.plugins.env' },
  { import = 'custom.plugins.ui' },
  { import = 'custom.plugins.coding' },
  { import = 'custom.plugins.editor' },
  { import = 'custom.plugins.ai' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
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

require('nvim-web-devicons').setup {
  override = {
    go = {
      icon = ' ',
      color = '#00ADD8',
      cterm_color = '74',
      name = 'Go',
    },
    html = {
      icon = ' ',
      color = '#EA580B',
      cterm_color = '74',
      name = 'Html',
    },
    css = {
      icon = ' ',
      color = '#8B5CF6',
      cterm_color = '74',
      name = 'Css',
    },
  },
  override_by_filename = {
    ['go.mod'] = {
      icon = '󰟓 ',
      color = '#F471B5',
      cterm_color = '74',
      name = 'GoMod',
    },
    ['go.sum'] = {
      icon = '󰟓 ',
      color = '#F471B5',
      cterm_color = '74',
      name = 'GoSum',
    },
    ['README.md'] = {
      icon = ' ',
      color = '#ffffff',
      cterm_color = '74',
      name = 'Readme',
    },
    ['Makefile'] = {
      icon = ' ',
      color = '#F471B5',
      cterm_color = '74',
      name = 'Makefile',
    },
    ['package-lock.json'] = {
      icon = ' ',
      color = '#2DD4BF',
      cterm_color = '74',
      name = 'PackageLock',
    },
    ['package.json'] = {
      icon = ' ',
      color = '#2DD4BF',
      cterm_color = '74',
      name = 'PackageJson',
    },
    ['.gitignore'] = {
      icon = ' ',
      color = '#F87171',
      cterm_color = '74',
      name = 'Gitignore',
    },
    ['tailwind.config.js'] = {
      icon = '󱏿',
      color = '#38BDF8',
      cterm_color = '74',
      name = 'TailwindConfig',
    },
    ['tailwind.config.ts'] = {
      icon = '󱏿',
      color = '#38BDF8',
      cterm_color = '74',
      name = 'TailwindConfigTS',
    },
  },
}
