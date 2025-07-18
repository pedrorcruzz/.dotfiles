return {
  {
    'catppuccin/nvim',
    lazy = true,
    config = function()
      local transparent_background = false
      require('catppuccin').setup {
        flavour = 'mocha',
        background = { light = 'latte', dark = 'mocha' },
        transparent_background = transparent_background,
        term_colors = true,
        integrations = {
          notify = true,
          mini = true,
        },
        styles = {
          comments = { 'italic' },
          functions = { 'bold' },
          keywords = { 'italic' },
        },
        custom_highlights = function(colors)
          return {
            NormalFloat = { bg = transparent_background and 'NONE' or '#1E1E2F' },
            WinSeparator = { fg = '#181826' },
            BufferLineFill = { bg = transparent_background and 'NONE' or '#181826' },
            BufferLineTabSelected = { fg = '#181827' },
            BufferLineIndicatorSelected = { fg = '#181827' },

            FloatBorder = { fg = '#6BB8FF' },
            Border = { fg = '#4c4c4c' },
            FloatShadow = { fg = '#4c4c4c' },
            VertSplit = { fg = '#4c4c4c' },
            CursorLine = { bg = '#45475C' },
            Underlined = { bg = '#45475C' },

            SnacksPicker = { bg = transparent_background and 'NONE' or '#181826' },
            SnacksPickerBorder = { fg = '#7DB6FF', bg = transparent_background and 'NONE' or '#181826' },
            SnacksPickerInputTitle = { fg = '#6390CA', bg = transparent_background and 'NONE' or '#181826' }, --explorer 202020 or 1A1A1A
            SnacksPickerToggle = { fg = '#6390CA', bg = transparent_background and 'NONE' or '#181826' }, --explorer 202020 or 1A1A1A

            TreesitterContext = { bg = transparent_background and 'NONE' or '#181826', fg = '#45475C' },
            TreesitterContextLineNumber = { bg = transparent_background and 'NONE' or '#181826', fg = '#45475C' },
            TreesitterContextBottom = { sp = '#45475c', underline = true },

            debugBreakpoint = { fg = '#B2BEFF' },
            DapUiBreakpointsDisabledLine = { fg = '#B2BEFF' },

            ['@punctuation.special'] = { fg = '#45475c' },
            ['@punctuation.special.tsx'] = { fg = '#FFC0EA' },
            ['@punctuation.special.jsx'] = { fg = '#FFC0EA' },
            ['@punctuation.special.htmldjango'] = { fg = '#FFC0EA' },
            ['@punctuation.special.javascript'] = { fg = '#FFC0EA' },
            ['@punctuation.special.typescript'] = { fg = '#FFC0EA' },

            GitSignsCurrentLineBlame = { fg = '#abb2bf' },
          }
        end,
      }
    end,
  },
}
