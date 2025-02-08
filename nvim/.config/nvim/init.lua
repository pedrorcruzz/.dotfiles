-- Require
require("config.keybinds")
require("config.autocmds")
require("config.options")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  { import = "custom.plugins.env" },
  { import = "custom.plugins.ui" },
  { import = "custom.plugins.coding" },
  { import = "custom.plugins.editor" },
  { import = "custom.plugins.ai" },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0) -- Obtém o primeiro argumento passado para o Neovim
    if vim.fn.argc() == 1 and vim.fn.isdirectory(arg) == 1 then
      vim.cmd("FzfLua files")
    end
  end,
})

-- Global
vim.opt.termguicolors = true
require("nvim-tree").setup({
  disable_netrw = false,
  hijack_netrw = false,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePre" }, {
  pattern = "*.lua",
  callback = function()
    vim.bo.tabstop = 3
    vim.bo.shiftwidth = 3
    vim.bo.expandtab = true
  end,
})

vim.opt.confirm = true

vim.bo.tabstop = 3
vim.bo.shiftwidth = 3
vim.bo.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  command = "setlocal nolist",
})

--Color cmdline

-- Borders
vim.defer_fn(function()
  vim.cmd([[highlight NoiceCmdlinePopupBorder guifg=#808080]])
end, 100)

-- Arrow
vim.defer_fn(function()
  vim.cmd([[highlight NoiceCmdlineIcon guifg=#FFFFFF]])
end, 100)

-- Emmet
vim.g.user_emmet_leader_key = "<C-y>"
