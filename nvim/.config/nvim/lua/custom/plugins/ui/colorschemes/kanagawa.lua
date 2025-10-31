return {
  'rebelot/kanagawa.nvim',
  lazy = true,
  config = function()
    local transparent_background = true

    require('kanagawa').setup {
      compile = false,
      undercurl = false,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = transparent_background,
      dimInactive = false,
      terminalColors = true,

      colors = {
        theme = {
          all = {
            ui = {
              -- bg_gutter = 'none',
            },
            -- syn = {
            --   keyword = '#C099FF',
            --   string = '#A1C181',
            -- },
            diag = {
              error = '#FF5F87',
              warn = '#FFAF00',
              info = '#6BB8FF',
              hint = '#A1C181',
            },
          },
        },
      },

      overrides = function(colors)
        local theme = colors.theme
        return {
          Directory = { fg = '#DAE7EC' }, --#A1BCC5
          EndOfBuffer = { fg = '#282727' },
          Visual = { bg = '#4c4c4c' }, --606060
          SnacksPicker = { bg = transparent_background and 'none' or '#1a1a1a' },
          SnacksInputIcon = { fg = '#fb4a34', bg = '#fb4a34' },
          SnacksPickerBorder = { fg = '#606060', bg = transparent_background and 'NONE' or '#1a1a1a' },
          SnacksPickerInputTitle = { fg = '#4c4c4c', bg = transparent_background and 'NONE' or '#1a1a1a' }, --explorer
          SnacksPickerToggle = { fg = '#4c4c4c', bg = transparent_background and 'NONE' or '#1a1a1a' }, --explorer
          StatusLineNC = { bg = transparent_background and 'NONE' or '#1c1c1c' },
          StatusLine = { bg = transparent_background and 'NONE' or '#1c1c1c' },
          -- VertSplit = { fg = transparent_background and '#1F1F1F' or '#665C54' },
          -- WinSeparator = { fg = transparent_background and '#1F1F1F' or '#665C54' },
          WinBar = { bg = transparent_background and 'NONE' or '#504944' },
          WinBarNC = { bg = transparent_background and 'NONE' or '#504944' },
          Pmenu = { bg = transparent_background and 'NONE' or '#504944' },
          PmenuSel = { bg = '#282727' },
        }
      end,

      theme = 'dragon',
      background = {
        dark = 'dragon',
        light = 'lotus',
      },
    }
  end,
}
