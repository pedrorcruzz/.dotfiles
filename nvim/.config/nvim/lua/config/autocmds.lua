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
-- Auto Save
local enable_autosave = true -- set to false to disable auto save

if enable_autosave then
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
end

-- Notify AutoSave status
-- vim.schedule(function()
--   local message = enable_autosave and 'AutoSave enabled ⚡' or 'AutoSave disabled ⛔'
--   local level = enable_autosave and vim.log.levels.INFO or vim.log.levels.WARN
--   vim.notify(message, level, { title = 'Neovim', timeout = 2000 })
-- end)

-- USE THE NVIM . (dot)
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local arg = vim.fn.argv(0)
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
local SNACKS_START_WITH_EXPLORER = true
local SNACKS_FOCUS_EXPLORER = false

if SNACKS_START_WITH_EXPLORER then
  local function is_opened_with_dot()
    if vim.fn.argc() == 1 then
      local arg = vim.fn.argv(0)
      local arg_path = vim.fn.fnamemodify(arg, ':p'):gsub('/$', '')
      local cwd = vim.fn.getcwd():gsub('/$', '')
      return arg == '.' or arg_path == cwd
    end
    return false
  end

  local opened_with_dot = is_opened_with_dot()

  local function focus_buffer_after_snacks(bufnr)
    local attempts = 0
    local function try_focus()
      if vim.api.nvim_buf_is_valid(bufnr) then
        local current_buf = vim.api.nvim_get_current_buf()
        if current_buf ~= bufnr then
          vim.api.nvim_set_current_buf(bufnr)
        end
      end
      attempts = attempts + 1
      if attempts < 10 then
        vim.defer_fn(try_focus, 20)
      end
    end
    try_focus()
  end

  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      if opened_with_dot then
        return
      end

      if vim.fn.argc() == 1 then
        local arg = vim.fn.argv(0)
        if vim.fn.isdirectory(arg) == 1 then
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks and snacks.explorer then
            local bufnr = vim.api.nvim_get_current_buf()
            snacks.explorer()
            if not SNACKS_FOCUS_EXPLORER then
              focus_buffer_after_snacks(bufnr)
            end
          end
        end
      end
    end,
  })

  vim.api.nvim_create_autocmd('BufReadPost', {
    once = true,
    callback = function(args)
      if opened_with_dot then
        return
      end

      local bufname = vim.api.nvim_buf_get_name(args.buf)
      local path = args.file or ''

      if bufname == '' or bufname:match 'snacks_picker_input' or bufname:match 'NvimTree_' or bufname:match '^%[.*%]$' or path:match '/nvim%.phrosa/' then
        return
      end

      local ok, snacks = pcall(require, 'snacks')
      if ok and snacks and snacks.explorer then
        local bufnr = args.buf
        snacks.explorer()
        if not SNACKS_FOCUS_EXPLORER then
          focus_buffer_after_snacks(bufnr)
        end
      end
    end,
  })
end

-- Relative Number
local enable_relative_number_toggle = false

if enable_relative_number_toggle then
  vim.api.nvim_create_augroup('RelativeNumberToggle', { clear = true })

  vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufEnter', 'FocusGained' }, {
    group = 'RelativeNumberToggle',
    callback = function()
      if vim.o.number then
        vim.wo.relativenumber = true
      end
    end,
  })

  vim.api.nvim_create_autocmd({ 'InsertEnter', 'BufLeave', 'FocusLost' }, {
    group = 'RelativeNumberToggle',
    callback = function()
      vim.wo.relativenumber = false
    end,
  })
end

-- Highlight LSP references
local enable_custom_reference_highlights = true

if enable_custom_reference_highlights then
  local my_highlights = vim.api.nvim_create_augroup('MyHighlights', { clear = true })

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = my_highlights,
    pattern = '*',
    callback = function()
      local highlight_style = { bold = true, bg = 'none', fg = '#FFFFFF' }

      vim.api.nvim_set_hl(0, 'LspReferenceRead', highlight_style)
      vim.api.nvim_set_hl(0, 'LspReferenceWrite', highlight_style)
      vim.api.nvim_set_hl(0, 'LspReferenceText', highlight_style)
    end,
  })
end

-- DBUI NO FOLDING
local enable_dbout_no_folding = true

if enable_dbout_no_folding then
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'dbout',
    callback = function()
      vim.cmd 'normal! zR'
    end,
  })
end
