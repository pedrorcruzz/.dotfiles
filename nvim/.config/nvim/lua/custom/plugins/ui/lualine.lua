local lualine_visible = false
local use_custom_theme = true

local function create_theme()
  local custom_only_bg_min = true
  local custom_multiple_bg_min = false
  local colors = {}

  if custom_only_bg_min then
    colors = {
      min_fg_branch = '#a9a9a9',
      min_bg_branch = '#2d2d2d',
      min_bar_bg = nil,
      min_git = '#FFFFFF',
      min_y_bg = '#2d2d2d',
      min_y_fg = '#a9a9a9',
      min_uni_fg_color = '#FEFEFE',
      min_uni_bg_color = '#1a1a1a',
      min_uni_bg_color_z = nil,
    }
  elseif custom_multiple_bg_min then
    colors = {
      multiple_min_fg_branch = '#a9a9a9',
      multiple_min_bg_branch = '#2d2d2d',
      vesper_bar_bg = nil,
      vesper_git = '#ECEFF4',
      vesper_y_bg = '#101010',
      vesper_y_fg = '#b0c4de',
      vesper_uni_fg_color = '#D8DEE9',
      vesper_uni_bg_color = '#101010',
      vesper_uni_bg_color_z = '#3B4252',
    }
  else
    colors = {
      default_branch_fg = '#abb2bf',
      default_branch_bg = nil,
      default_fg_color = '#1A1A1A',
      default_y_bg = nil,
      default_bar_bg = nil,
      default_y_fg = '#a9a9a9',
      default_normal = '#64BAFF',
      default_insert = '#FF7081',
      default_visual = '#B990F7',
      default_replace = '#ffa066',
      default_command = '#75bf63',
      default_location_fg = '#FFFFFF',
      default_location_bg = nil,
    }
  end

  local function mode_section(bg)
    return {
      fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
      bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or bg,
      gui = 'bold',
    }
  end

  local function branch_section()
    return {
      fg = colors.min_fg_branch or colors.multiple_min_fg_branch or colors.default_branch_fg,
      bg = colors.min_bg_branch or colors.multiple_min_bg_branch or colors.default_branch_bg,
      gui = 'bold',
    }
  end

  local function y_section()
    return {
      fg = colors.min_y_fg or colors.vesper_y_fg or colors.default_y_fg,
      bg = colors.min_y_bg or colors.vesper_y_bg or colors.default_y_bg,
      gui = 'bold',
    }
  end

  local function z_section(bg)
    return {
      fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
      bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or bg,
      gui = 'bold',
    }
  end

  return {
    normal = {
      a = mode_section(colors.default_normal),
      b = branch_section(),
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = y_section(),
      z = z_section(colors.default_normal),
    },
    insert = {
      a = mode_section(colors.default_insert),
      b = branch_section(),
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = y_section(),
      z = z_section(colors.default_insert),
    },
    visual = {
      a = mode_section(colors.default_visual),
      b = branch_section(),
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = y_section(),
      z = z_section(colors.default_visual),
    },
    replace = {
      a = mode_section(colors.default_replace),
      b = branch_section(),
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = y_section(),
      z = z_section(colors.default_replace),
    },
    command = {
      a = mode_section(colors.default_command),
      b = branch_section(),
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = y_section(),
      z = z_section(colors.default_command),
    },
  }
end

local lualine_config = {
  options = {
    theme = use_custom_theme and create_theme() or 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(mode)
          return '󰅶 ' .. mode
        end,
        separator = { left = '', right = '' },
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
    lualine_x = { 'diagnostics' },
    lualine_y = {
      'copilot',
      {
        'lsp_status',
        icon = '',
        symbols = {
          spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
          done = '✓',
          separator = ' ',
        },
        ignore_lsp = { 'copilot', 'tailwindcss' },
      },
      'progress',
      { 'filename', symbols = { modified = '●', readonly = '' } },
      'filetype',
      {
        function()
          local venv = os.getenv 'VIRTUAL_ENV'
          return venv and (' ' .. venv:match '([^/]+)$') or ''
        end,
        color = { fg = '#ffffff', gui = 'bold' },
        left_padding = 2,
      },
    },
    lualine_z = {
      { 'location', separator = { left = '', right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_z = { 'location' },
  },
}

function ToggleLualine()
  local lualine = require 'lualine'
  if not package.loaded['lualine'] then
    lualine.setup(lualine_config)
  end
  lualine_visible = not lualine_visible
  lualine.hide { unhide = lualine_visible }
end

vim.keymap.set('n', '<leader>ll', ToggleLualine, { silent = true })

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  lazy = true,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'AndreM222/copilot-lualine', lazy = true },
  },
  config = function()
    vim.o.laststatus = 3
    local lualine = require 'lualine'
    lualine.setup(lualine_config)
    lualine.hide { unhide = lualine_visible }
  end,
}
