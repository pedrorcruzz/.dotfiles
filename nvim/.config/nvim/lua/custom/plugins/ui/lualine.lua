local lualine_visible = true
local use_custom_theme = false

local function create_theme()
  local custom_only_bg_min = true
  local custom_only_bg_catpuccin = false
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
  elseif custom_only_bg_catpuccin then
    colors = {
      multiple_min_fg_branch = '#7DB6FF',
      multiple_min_bg_branch = '#313245',
      catpuccin_bar_bg = nil,
      catpuccin_git = '#ECEFF4',
      catpuccin_y_bg = '#313245',
      catpuccin_y_fg = '#7DB6FF',
      catpuccin_uni_fg_color = '#181826',
      catpuccin_uni_bg_color = '#7DB6FF',
      catpuccin_uni_bg_color_z = '#3B4252',
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

  return {
    normal = {
      a = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_normal,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.multiple_min_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.multiple_min_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = {
        fg = colors.min_git or colors.catpuccin_git,
        bg = colors.min_bar_bg or colors.catpuccin_bar_bg or colors.default_bar_bg,
      },
      y = {
        fg = colors.min_y_fg or colors.catpuccin_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.catpuccin_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_normal,
        gui = 'bold',
      },
    },
    insert = {
      a = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_insert,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.multiple_min_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.multiple_min_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = {
        fg = colors.min_git or colors.catpuccin_git,
        bg = colors.min_bar_bg or colors.catpuccin_bar_bg or colors.default_bar_bg,
      },
      y = {
        fg = colors.min_y_fg or colors.catpuccin_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.catpuccin_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_insert,
        gui = 'bold',
      },
    },
    visual = {
      a = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_visual,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.multiple_min_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.multiple_min_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = {
        fg = colors.min_git or colors.catpuccin_git,
        bg = colors.min_bar_bg or colors.catpuccin_bar_bg or colors.default_bar_bg,
      },
      y = {
        fg = colors.min_y_fg or colors.catpuccin_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.catpuccin_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_visual,
        gui = 'bold',
      },
    },
    replace = {
      a = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_replace,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.multiple_min_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.multiple_min_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = {
        fg = colors.min_git or colors.catpuccin_git,
        bg = colors.min_bar_bg or colors.catpuccin_bar_bg or colors.default_bar_bg,
      },
      y = {
        fg = colors.min_y_fg or colors.catpuccin_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.catpuccin_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_replace,
        gui = 'bold',
      },
    },
    command = {
      a = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_command,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.multiple_min_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.multiple_min_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = {
        fg = colors.min_git or colors.catpuccin_git,
        bg = colors.min_bar_bg or colors.catpuccin_bar_bg or colors.default_bar_bg,
      },
      y = {
        fg = colors.min_y_fg or colors.catpuccin_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.catpuccin_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.catpuccin_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.catpuccin_uni_bg_color or colors.default_command,
        gui = 'bold',
      },
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
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
          untracked = '󰝤',
        },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' ',
        },
      },
    },
    lualine_y = {
      'copilot',
      {
        'lsp_status',
        icon = ' ',
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
  local lualine = require 'lualine'
  if not package.loaded['lualine'] then
    lualine.setup(lualine_config)
  end
  lualine_visible = not lualine_visible
  lualine.hide { unhide = lualine_visible }
end

vim.api.nvim_set_keymap('n', '<leader>ll', ':lua ToggleLualine()<CR>', { noremap = true, silent = true })

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  lazy = true,
  dependencies = {
    -- { 'nvim-tree/nvim-web-devicons', lazy = true, enabled = vim.g.have_nerd_font },
    { 'echasnovski/mini.icons' },
    { 'AndreM222/copilot-lualine', lazy = true },
  },
  config = function()
    vim.o.laststatus = 3
    local lualine = require 'lualine'
    lualine.setup(lualine_config)
    lualine.hide { unhide = lualine_visible }
  end,
}
