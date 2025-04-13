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

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'AvanteInlineHint', {})
    vim.api.nvim_set_hl(0, 'AvanteInlineHint', { fg = '#606060', bg = 'none' })
  end,
})
