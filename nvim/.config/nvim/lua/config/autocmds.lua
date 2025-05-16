-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto save files when focus is lost
vim.api.nvim_create_autocmd('FocusLost', {
  desc = 'Auto save files when focus is lost',
  group = vim.api.nvim_create_augroup('kickstart-autosave', { clear = true }),
  callback = function()
    vim.cmd 'silent! wa'
  end,
})

-- Auto save files when buffer is hidden
vim.api.nvim_create_autocmd('BufLeave', {
  desc = 'Auto save files when buffer is hidden',
  group = vim.api.nvim_create_augroup('kickstart-autosave', { clear = false }),
  callback = function()
    vim.cmd 'silent! wa'
  end,
})

-- USAR O NVIM .
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local arg = vim.fn.argv(0) -- Obtém o primeiro argumento passado para o Neovim
    if vim.fn.argc() == 1 and vim.fn.isdirectory(arg) == 1 then
      Snacks.picker.smart()
      -- vim.cmd 'FzfLua files'
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dashboard',
  command = 'setlocal nolist',
})

-- ToggleTerm
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd [[
  augroup ToggleTermKeymaps
    autocmd!
    autocmd TermOpen term://*toggleterm#* lua set_terminal_keymaps()
  augroup END
]]

-- AvanteInlineHint
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, 'AvanteInlineHint', { fg = '#606060', bg = 'none' })
    end, 10)
  end,
})

-- Snacks Explorer
SNACKS_START_WITH_EXPLORER = true
if SNACKS_START_WITH_EXPLORER then
  vim.api.nvim_create_autocmd('BufReadPost', {
    once = true,
    callback = function()
      local ok, snacks = pcall(require, 'snacks')
      if ok and snacks and snacks.explorer then
        snacks.explorer()
      else
        vim.notify('Snacks Explorer não pôde ser carregado', vim.log.levels.WARN)
      end
    end,
  })
end
