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
    local colors = {
      darkgray = '#16161d',
      gray = '#727169',
      branchfg = '#a9a9a9',
      branchbg = '#2d2d2d',
      innerbg = nil,
      -- outerbg = nil,
      outerbg = '#2d2d2d',
      normal = '#64BAFF',
      insert = '#FF7081',
      visual = '#B990F7',
      replace = '#ffa066',
      command = '#75bf63',
      git = '#FFFFFF',
      fgBlack = '#FEFEFE',
      bgBlack = '#1a1a1a',
    }

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
            a = { fg = colors.fgBlack, bg = colors.bgBlack, gui = 'bold' },
            b = { fg = colors.branchfg, bg = colors.branchbg },
            c = { fg = colors.gray, bg = colors.innerbg },
            y = { fg = colors.branchfg, bg = colors.outerbg },
          },
          insert = {
            a = { fg = colors.fgBlack, bg = colors.bgBlack, gui = 'bold' },
            b = { fg = colors.branchfg, bg = colors.branchbg },
            c = { fg = colors.gray, bg = colors.innerbg },
            y = { fg = colors.branchfg, bg = colors.outerbg },
          },
          visual = {
            a = { fg = colors.fgBlack, bg = colors.bgBlack, gui = 'bold' },
            b = { fg = colors.branchfg, bg = colors.branchbg },
            c = { fg = colors.gray, bg = colors.innerbg },
            y = { fg = colors.branchfg, bg = colors.outerbg },
          },
          replace = {
            a = { fg = colors.fgBlack, bg = colors.bgBlack, gui = 'bold' },
            b = { fg = colors.branchfg, bg = colors.branchbg },
            c = { fg = colors.gray, bg = colors.innerbg },
            y = { fg = colors.branchfg, bg = colors.outerbg },
          },
          command = {
            a = { fg = colors.fgBlack, bg = colors.bgBlack, gui = 'bold' },
            b = { fg = colors.branchfg, bg = colors.branchbg },
            c = { fg = colors.gray, bg = colors.innerbg },
            y = { fg = colors.branchfg, bg = colors.outerbg },
          },
          inactive = {
            a = { fg = colors.fgBlack, bg = colors.outerbg, gui = 'bold' },
            b = { fg = colors.branchfg, bg = colors.branchbg },
            c = { fg = colors.gray, bg = colors.innerbg },
            y = { fg = colors.branchfg, bg = colors.outerbg },
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
              return '󰊠 ' .. mode --  󰨈   󰠥 󰊠
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
          {
            function()
              return ' LSP: ' .. lsp_status()
            end,
            color = { fg = '#ffffff', gui = 'bold' },
          },
          'copilot',
          'progress',
          'filetype',
          { 'filename', symbols = { modified = '●', readonly = '' } },
          {
            function()
              return get_venv_name() ~= '' and ' ' .. get_venv_name() or ''
            end,
            color = { fg = '#ffffff', gui = 'bold' }, -- Pode customizar a cor aqui
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
