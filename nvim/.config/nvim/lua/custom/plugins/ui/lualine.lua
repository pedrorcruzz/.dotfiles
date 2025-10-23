local lualine_visible = true

local function create_theme()
  local custom_min_theme = false
  local custom_vesper = false
  local colors = {}

  if custom_min_theme then
    colors = {
      min_fg_branch = '#a9a9a9',
      min_bg_branch = '#2d2d2d',
      -- min_bar_bg = '#1C1C1C', --2d2d2d
      min_bar_bg = nil,
      min_git = '#FFFFFF',
      min_y_bg = '#2d2d2d',
      -- min_y_bg = nil,
      min_y_fg = '#a9a9a9',
      min_uni_fg_color = '#FEFEFE',
      min_uni_bg_color = '#1a1a1a',
      min_uni_bg_color_z = nil,
    }
  elseif custom_vesper then
    colors = {
      vesper_fg_branch = '#b0c4de',
      vesper_bg_branch = '#101010', --#1A1A1A
      vesper_bar_bg = '#121212',
      -- vesper_bar_bg = '#000000',
      vesper_git = '#ECEFF4',
      vesper_y_bg = '#101010',
      -- vesper_y_bg = nil,
      vesper_y_fg = '#b0c4de',
      vesper_uni_fg_color = '#D8DEE9',
      vesper_uni_bg_color = '#101010', --#0D0D0D
      vesper_uni_bg_color_z = '#3B4252',
    }
  else
    colors = {
      default_branch_fg = '#abb2bf',
      default_branch_bg = nil, -- 2d2d2d 202020
      default_fg_color = '#1A1A1A',
      default_y_bg = nil,
      -- default_bar_bg = '#2d2d2d',
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
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_normal,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.vesper_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.vesper_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = {
        fg = colors.min_y_fg or colors.vesper_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.vesper_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_normal,
        gui = 'bold',
      },
    },
    insert = {
      a = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_insert,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.vesper_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.vesper_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = {
        fg = colors.min_y_fg or colors.vesper_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.vesper_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_insert,
        gui = 'bold',
      },
    },
    visual = {
      a = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_visual,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.vesper_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.vesper_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = {
        fg = colors.min_y_fg or colors.vesper_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.vesper_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_visual,
        gui = 'bold',
      },
    },
    replace = {
      a = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_replace,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.vesper_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.vesper_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = {
        fg = colors.min_y_fg or colors.vesper_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.vesper_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_replace,
        gui = 'bold',
      },
    },
    command = {
      a = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_command,
        gui = 'bold',
      },
      b = {
        fg = colors.min_fg_branch or colors.vesper_fg_branch or colors.default_branch_fg,
        bg = colors.min_bg_branch or colors.vesper_bg_branch or colors.default_branch_bg,
        gui = 'bold',
      },
      c = { fg = colors.min_git or colors.vesper_git, bg = colors.min_bar_bg or colors.vesper_bar_bg or colors.default_bar_bg },
      y = {
        fg = colors.min_y_fg or colors.vesper_y_fg or colors.default_y_fg,
        bg = colors.min_y_bg or colors.vesper_y_bg or colors.default_y_bg,
        gui = 'bold',
      },
      z = {
        fg = colors.min_uni_fg_color or colors.vesper_uni_fg_color or colors.default_fg_color,
        bg = colors.min_uni_bg_color or colors.vesper_uni_bg_color or colors.default_command,
        gui = 'bold',
      },
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
    lualine_z = {
      { 'location', separator = { left = '', right = '' }, left_padding = 2 },
      -- { 'location', separator = { left = '', right = '' }, left_padding = 2 },
      -- { 'location', separator = { left = '', right = '' }, left_padding = 2 },
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
    vim.o.laststatus = 3 -- or 3,  if u want global bar even hidden or 0 if u want to disable it
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
