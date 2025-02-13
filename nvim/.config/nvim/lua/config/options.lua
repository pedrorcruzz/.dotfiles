-- Array of file names indicating root directory. Modify to your liking.
local root_names = { '.git', 'Makefile' }

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

local set_root = function()
  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    return
  end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then
      return
    end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
end

-- Emmet
vim.g.user_emmet_leader_key = '<C-y>'

--Confirm before closing unsaved buffer
vim.opt.confirm = true

--Color cmdline
-- Borders
-- vim.defer_fn(function()
--   vim.cmd [[highlight NoiceCmdlinePopupBorder guifg=#808080]]
-- end, 100)

-- Arrow
-- vim.defer_fn(function()
--   vim.cmd [[highlight NoiceCmdlineIcon guifg=#FFFFFF]]
-- end, 100)

local root_augroup = vim.api.nvim_create_augroup('MyAutoRoot', {})
vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- Esquerda
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- Direita
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true }) -- Baixo
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true }) -- Cima

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Disables netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Enable line wrap
-- vim.opt.wrap = true
-- vim.opt.textwidth = 80

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable line wrapping
vim.opt.laststatus = 3
