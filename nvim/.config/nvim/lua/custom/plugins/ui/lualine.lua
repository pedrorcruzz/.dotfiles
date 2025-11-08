local lualine_visible = false
local use_custom_theme = true

local function load_colors()
  local use_custom_only_bg_min = false
  local use_custom_multiple_bg_min = false

  if use_custom_only_bg_min then
    return require 'custom.plugins.ui.lualine_themes.custom_only_bg_min'
  elseif use_custom_multiple_bg_min then
    return require 'custom.plugins.ui.lualine_themes.custom_multiple_bg_min'
  else
    return require 'custom.plugins.ui.lualine_themes.default'
  end
end

local function create_theme()
  if not use_custom_theme then
    return 'auto'
  end

  local colors = load_colors()

  return {
    normal = {
      a = { fg = colors.a_fg, bg = colors.a_bg, gui = 'bold' },
      b = { fg = colors.b_fg, bg = colors.b_bg, gui = 'bold' },
      c = { fg = colors.c_fg, bg = colors.c_bg },
      y = { fg = colors.y_fg, bg = colors.y_bg, gui = 'bold' },
      z = { fg = colors.z_fg, bg = colors.z_bg, gui = 'bold' },
    },
    insert = {
      a = { fg = colors.a_fg, bg = colors.insert_bg, gui = 'bold' },
      b = { fg = colors.b_fg, bg = colors.b_bg, gui = 'bold' },
      c = { fg = colors.c_fg, bg = colors.c_bg },
      y = { fg = colors.y_fg, bg = colors.y_bg, gui = 'bold' },
      z = { fg = colors.z_fg, bg = colors.insert_bg, gui = 'bold' },
    },
    visual = {
      a = { fg = colors.a_fg, bg = colors.visual_bg, gui = 'bold' },
      b = { fg = colors.b_fg, bg = colors.b_bg, gui = 'bold' },
      c = { fg = colors.c_fg, bg = colors.c_bg },
      y = { fg = colors.y_fg, bg = colors.y_bg, gui = 'bold' },
      z = { fg = colors.z_fg, bg = colors.visual_bg, gui = 'bold' },
    },
    replace = {
      a = { fg = colors.a_fg, bg = colors.replace_bg, gui = 'bold' },
      b = { fg = colors.b_fg, bg = colors.b_bg, gui = 'bold' },
      c = { fg = colors.c_fg, bg = colors.c_bg },
      y = { fg = colors.y_fg, bg = colors.y_bg, gui = 'bold' },
      z = { fg = colors.z_fg, bg = colors.replace_bg, gui = 'bold' },
    },
    command = {
      a = { fg = colors.a_fg, bg = colors.command_bg, gui = 'bold' },
      b = { fg = colors.b_fg, bg = colors.b_bg, gui = 'bold' },
      c = { fg = colors.c_fg, bg = colors.c_bg },
      y = { fg = colors.y_fg, bg = colors.y_bg, gui = 'bold' },
      z = { fg = colors.z_fg, bg = colors.command_bg, gui = 'bold' },
    },
  }
end

local lualine_config = {
  options = {
    theme = create_theme(),
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(mode)
          return '󰅶 ' .. mode --󰅶 󱄛
        end,
        separator = { left = '', right = '' },
        -- separator = { left = '', right = '' },
        -- separator = { left = '', right = '' },
        right_padding = 10,
        color = { gui = 'bold' },
      },
    },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ', untracked = '󰝤' },
      },
    },
    lualine_x = {
      'diagnostics',
    },
    lualine_y = {
      'copilot',
      'progress',
      { 'filename', symbols = { modified = '●', readonly = '' } },
      'filetype',
      {
        function()
          local venv = os.getenv 'VIRTUAL_ENV'
          return venv and venv:match '([^/]+)$' and (' ' .. venv:match '([^/]+)$') or ''
        end,
        color = { fg = '#ffffff', gui = 'bold' },
        left_padding = 2,
      },
    },
    lualine_z = {
      { 'location', separator = { left = '', right = '' }, left_padding = 2 },
      -- { 'location', separator = { left = '', right = '' }, left_padding = 2 },
      -- { 'location', separator = { left = '', right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
}

function ToggleLualine()
  if lualine_visible then
    require('lualine').hide { unhide = false }
    vim.o.laststatus = 3
    lualine_visible = false
  else
    vim.o.laststatus = 3
    if not package.loaded['lualine'] or not require('lualine').statusline then
      require('lualine').setup(lualine_config)
    end
    require('lualine').hide { unhide = true }
    lualine_visible = true
  end
end

vim.api.nvim_set_keymap('n', '<leader>ll', ':lua ToggleLualine()<CR>', { noremap = true, silent = true })

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  lazy = true,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true, enabled = vim.g.have_nerd_font },
    { 'AndreM222/copilot-lualine', lazy = true },
  },
  config = function()
    if lualine_visible then
      vim.o.laststatus = 3
      require('lualine').setup(lualine_config)
    else
      vim.o.laststatus = 0
    end
  end,
}
