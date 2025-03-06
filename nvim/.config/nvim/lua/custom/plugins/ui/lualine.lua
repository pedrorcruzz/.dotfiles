-- Other separator symbols:
-- █
--   
--   
--   
--   
--   
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    enabled = vim.g.have_nerd_font,
    { 'AndreM222/copilot-lualine' },
  },
  config = function()
    local custom_min_theme = true

    local colors = {}

    if custom_min_theme then
      colors = {
        min_fg_branch = '#a9a9a9',
        min_bg_branch = '#2d2d2d',
        -- min_bar_bg = '#2d2d2d',
        min_bar_bg = nil,
        min_normal = '#64BAFF',
        min_insert = '#FF7081',
        min_visual = '#B990F7',
        min_replace = '#ffa066',
        min_command = '#75bf63',
        min_git = '#FFFFFF',
        min_y_bg = '#2d2d2d',
        min_y_fg = '#a9a9a9',

        min_uni_fg_color = '#FEFEFE',
        min_uni_bg_color = '#1a1a1a',
        min_uni_bg_color_z = nil,
      }
    else
      colors = {
        default_branch_fg = '#abb2bf',
        default_branch_bg = '#202020', -- 2d2d2d
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

    local function get_venv_name()
      local venv = os.getenv 'VIRTUAL_ENV'
      return venv and venv:match '([^/]+)$' or ''
    end

    local function lsp_status()
      local msg = 'None'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end

    require('lualine').setup {
      options = {
        theme = {
          normal = {
            a = { fg = colors.min_uni_fg_color or colors.default_fg_color, bg = colors.min_uni_bg_color or colors.default_normal, gui = 'bold' },
            b = { fg = colors.min_fg_branch or colors.default_branch_fg, bg = colors.min_bg_branch or colors.default_branch_bg, gui = 'bold' },
            c = { fg = colors.min_git, bg = colors.min_bar_bg or colors.default_bar_bg },
            y = { fg = colors.min_y_fg or colors.default_y_fg, bg = colors.min_y_bg or colors.default_y_bg, gui = 'bold' },
            z = { fg = colors.min_uni_fg_color or colors.default_location_fg, bg = colors.min_uni_bg_color or colors.default_location_bg, gui = 'bold' },
          },
          insert = {
            a = { fg = colors.min_uni_fg_color or colors.default_fg_color, bg = colors.min_uni_bg_color or colors.default_insert, gui = 'bold' },
            b = { fg = colors.min_fg_branch or colors.default_branch_fg, bg = colors.min_bg_branch or colors.default_branch_bg, gui = 'bold' },
            c = { fg = colors.min_git, bg = colors.min_bar_bg or colors.default_bar_bg },
            y = { fg = colors.min_y_fg or colors.default_y_fg, bg = colors.min_y_bg or colors.default_y_bg, gui = 'bold' },
            z = { fg = colors.min_uni_fg_color or colors.default_location_fg, bg = colors.min_uni_bg_color or colors.default_location_bg, gui = 'bold' },
          },
          visual = {
            a = { fg = colors.min_uni_fg_color or colors.default_fg_color, bg = colors.min_uni_bg_color or colors.default_visual, gui = 'bold' },
            b = { fg = colors.min_fg_branch or colors.default_branch_fg, bg = colors.min_bg_branch or colors.default_branch_bg, gui = 'bold' },
            c = { fg = colors.min_git, bg = colors.min_bar_bg or colors.default_bar_bg },
            y = { fg = colors.min_y_fg or colors.default_y_fg, bg = colors.min_y_bg or colors.default_y_bg, gui = 'bold' },
            z = { fg = colors.min_uni_fg_color or colors.default_location_fg, bg = colors.min_uni_bg_color or colors.default_location_bg, gui = 'bold' },
          },
          replace = {
            a = { fg = colors.min_uni_fg_color or colors.default_fg_color, bg = colors.min_uni_bg_color or colors.default_replace, gui = 'bold' },
            b = { fg = colors.min_fg_branch or colors.default_branch_fg, bg = colors.min_bg_branch or colors.default_branch_bg, gui = 'bold' },
            c = { fg = colors.min_git, bg = colors.min_bar_bg or colors.default_bar_bg },
            y = { fg = colors.min_y_fg or colors.default_y_fg, bg = colors.min_y_bg or colors.default_y_bg, gui = 'bold' },
            z = { fg = colors.min_uni_fg_color or colors.default_location_fg, bg = colors.min_uni_bg_color or colors.default_location_bg, gui = 'bold' },
          },
          command = {
            a = { fg = colors.min_uni_fg_color or colors.default_fg_color, bg = colors.min_uni_bg_color or colors.default_command, gui = 'bold' },
            b = { fg = colors.min_fg_branch or colors.default_branch_fg, bg = colors.min_bg_branch or colors.default_branch_bg, gui = 'bold' },
            c = { fg = colors.min_git, bg = colors.min_bar_bg or colors.default_bar_bg },
            y = { fg = colors.min_y_fg or colors.default_y_fg, bg = colors.min_y_bg or colors.default_y_bg, gui = 'bold' },
            z = { fg = colors.min_uni_fg_color or colors.default_location_fg, bg = colors.min_uni_bg_color or colors.default_location_bg, gui = 'bold' },
          },
        },
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(mode)
              return '󰊠 ' .. mode
            end,
            separator = { left = '', right = '' },
            right_padding = 2,
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
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
        lualine_y = {
          -- {
          --   function()
          --     return ' LSP: ' .. lsp_status()
          --   end,
          --   color = { fg = '#ffffff', gui = 'bold' },
          -- },
          'copilot',
          'progress',
          'filetype',
          -- { 'filename', symbols = { modified = '●', readonly = '' } },
          {
            function()
              return get_venv_name() ~= '' and ' ' .. get_venv_name() or ''
            end,
            color = { fg = '#ffffff', gui = 'bold' },
            separator = { right = '' },
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
  end,
}
