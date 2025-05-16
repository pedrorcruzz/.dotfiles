local function set_theme(theme)
  vim.cmd('colorscheme ' .. theme)
end

local default_theme = 'min-theme'

return {
  {
    'datsfilipe/min-theme.nvim',
    config = function()
      local transparent_background = false
      require('min-theme').setup {
        transparent = transparent_background,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },
        overrides = {
          Directory = { fg = '#DAE7EC' }, --#A1BCC5

          Normal = { fg = '#abb2bf', bg = transparent_background and 'none' or '#1F1F1F' }, --#202020 #000000 #1F1F1F
          EndOfBuffer = { fg = '#1F1F1F', bg = 'none' },
          NormalFloat = { bg = transparent_background and 'none' or '#1F1F1F' },
          -- VertSplit = { fg = '#4c4c4c' },
          VertSplit = { fg = transparent_background and '#1F1F1F' or '#1A1A1A' }, -- #1a1a1a
          WinSeparator = { fg = '#1A1A1A' },

          Visual = { bg = transparent_background and '#4c4c4c' or '#4c4c4c' }, --606060
          CursorLine = { bg = '#323232' },
          CursorLineNr = { fg = '#C6C6C6' },
          SignColumn = { bg = transparent_background and 'none' or '#323232' },
          LineNr = { fg = '#505050' }, --#4b5263 #727272
          FloatBorder = { fg = '#4c4c4c' }, --#4c4c4c
          Border = { fg = '#4c4c4c' },
          FloatShadow = { fg = '#4c4c4c' },
          Search = { bg = '#606060', fg = '#abb2bf' },
          IncSearch = { bg = '#606060', fg = '#F67582' },
          AvanteInlineHint = { fg = '#606060', bg = 'none' }, --#abb2bf
          -- Keyword = { fg = '#606060' }, --#abb2bf
          Folded = { fg = '#B990F6', bg = '#1a1a1a' },

          Underlined = { bg = nil },
          -- WinBarNC = { fg = '#202020', bg = transparent_background and 'NONE' or '#202020' }, -- barra de janelas não ativa
          -- WinBar = { fg = '#202020', bg = transparent_background and 'NONE' or '#202020' }, -- barra de janelas não ativa
          -- TabLine = { bg = transparent_background and 'NONE' or '#202020' },
          -- TabLineFill = { bg = transparent_background and 'NONE' or '#202020' },
          MatchParen = { fg = '#abb2bf' }, --quando coloca o cursor em cima de um parênteses / tag
          NonText = { fg = '#727272' },
          Title = { fg = '#FFFFFF' },
          Question = { fg = '#FFFFFF' },

          TreesitterContext = { fg = '#505050', bg = transparent_background and 'none' or '#1c1c1c' },
          TreesitterContextLineNumber = { fg = '#505050', bg = transparent_background and 'none' or '#1c1c1c' },
          TreesitterContextBottom = { sp = '#505050', underline = true },

          --underline cmp preview
          ['@markup.heading.1.markdown'] = { fg = '#abb2bf' },

          ['@punctuation.bracket'] = { fg = '#abb2bf' },

          --Buferlines
          -- BufferLinePick = { fg = '#CA8BFF' },
          -- BufferLinePickVisible = { fg = '#CA8BFF' },
          -- BufferLinePickSelected = { fg = '#CA8BFF' },
          BufferLineModified = { fg = '#A9A9A9' },
          BufferLineModifiedVisible = { fg = '#A9A9A9' },
          BufferLineModifiedSelected = { fg = '#A9A9A9' },
          BufferLineBufferSelected = { fg = '#A9A9A9' },
          BufferLineBackground = { fg = '#606060' },

          --Punctuation Special
          ['@punctuation.special'] = { fg = '#323232' },
          ['@punctuation.special.bash'] = { fg = '#DA70D6' },
          ['@punctuation.special.python'] = { fg = '#DA70D6' },
          ['@punctuation.special.javascript'] = { fg = '#DA70D6' },
          ['@punctuation.special.typescript'] = { fg = '#DA70D6' },
          ['@punctuation.special.jsx'] = { fg = '#DA70D6' },
          ['@punctuation.special.tsx'] = { fg = '#DA70D6' },
          ['@punctuation.special.go'] = { fg = '#DA70D6' },
          ['@punctuation.special.elixir'] = { fg = '#DA70D6' },
          ['@punctuation.special.c'] = { fg = '#DA70D6' },
          ['@punctuation.special.lua'] = { fg = '#DA70D6' },
          ['@punctuation.special.php'] = { fg = '#DA70D6' },
          ['@punctuation.special.json'] = { fg = '#DA70D6' },

          --variable
          ['@variable'] = { fg = '#BCBBBB' },
          ['@variable.builtin'] = { fg = '#BCBBBB' },

          --constant
          ['@constant'] = { fg = '#B3B2B3' },

          --bash
          ['@string.bash'] = { fg = '#BAB9BA' },
          ['@number.bash'] = { fg = '#BAB9BA' },
          ['@variable.bash'] = { fg = '#BAB9BA' },
          ['@constant.bash'] = { fg = '#F67582' },

          --module
          ['@module'] = { fg = '#B6B5B6' },

          --constructor
          ['@constructor'] = { fg = '#c18efe' },

          --Documentation
          ['@string.documentation'] = { fg = '#646B73' },

          --html
          ['@none.html'] = { fg = '#B0AFB0' },
          ['@markup.heading.1.html'] = { fg = '#AAA9AA' },
          ['@markup.heading.2.html'] = { fg = '#AAA9AA' },
          ['@markup.heading.3.html'] = { fg = '#AAA9AA' },
          ['@markup.heading.4.html'] = { fg = '#AAA9AA' },
          ['@markup.heading.5.html'] = { fg = '#AAA9AA' },
          ['@markup.heading.6.html'] = { fg = '#AAA9AA' },

          --JSX and TSX
          -- ['@tag.jsx.element'] = { fg = '#B0AFB0' },

          --htmldjango
          ['@punctuation.special.htmldjango'] = { fg = '#FED600' },
          ['@variable.htmldjango'] = { fg = '#92A4B6' },
          ['@function.htmldjango'] = { fg = '#F67582' },
          ['@keyword.repeat.htmldjango'] = { fg = '#F67582' },
          ['@keyword.operator.htmldjango'] = { fg = '#F67582' },

          --Grapple
          GrappleHint = { fg = '#ffffff' },
          GrappleNormal = { fg = '#606060' },
          GrappleFooter = { fg = '#4c4c4c' },
          GrappleBold = { fg = '#abb2bf' },
          GrappleCurrent = { fg = '#abb2bf' },
          GrappleName = { fg = '#ffffff' },
          GrappleTitle = { fg = '#ffffff' },

          --Telescope
          TelescopeBorder = { fg = '#ffffff' },
          TelescopePreviewBorder = { fg = '#4c4c4c' },
          TelescopePromptBorder = { fg = '#4c4c4c' },
          TelescopeResultsBorder = { fg = '#4c4c4c' },

          --todo
          TodoBgTODO = { bg = '#64baff', fg = '#111111', bold = true },
          TodoBgNOTE = { bg = '#c18efe', fg = '#111111', bold = true },
          TodoBgWARN = { bg = '#ffa868', fg = '#111111', bold = true },
          TodoBgFIX = { bg = '#F67582', fg = '#111111', bold = true },
          TodoFgTODO = { fg = '#64baff' },
          TodoFgNOTE = { fg = '#c18efe' },
          TodoFgWARN = { fg = '#ffa868' },
          TodoFgFIX = { fg = '#F67582' },
          -- todobghack = { bg = '#c18efe', fg = '#111111', bold = true },
          -- todofghack = { fg = '#c18efe' },

          --diagnostic
          -- diagnosticerror = { fg = '#be5046' },
          DiagnosticWarn = { fg = '#ffa868' },
          DiagnosticInfo = { fg = '#64baff' },
          DiagnosticHint = { fg = '#c18efe' },

          -- snacks notifier
          SnacksNotifierBorderInfo = { fg = '#4c4c4c' },
          SnacksNotifierBorderWarn = { fg = '#ffa868' },
          SnacksNotifierBorderError = { fg = '#F67582' },
          SnacksNotifierTitleInfo = { fg = '#ffffff' },

          SnacksPickerTitle = { fg = '#ffffff', bg = '#323232' },
          SnacksPickerInputTitle = { fg = '#abb2bf', bg = '#1A1A1A' }, --explorer 202020 or 1A1A1A
          SnacksPickerToggle = { fg = '#abb2bf', bg = '#1A1A1A' },

          -- SnacksPicker = { bg = '#1A1A1A' },
          SnacksPicker = { bg = transparent_background and 'none' or '#1A1A1A' },
          SnacksPickerBorder = { fg = '#323232', bg = transparent_background and 'none' or '#1A1A1A' },

          SnacksInputIcon = { fg = '#abb2bf' }, --#ff657e
          SnacksInputTitle = { fg = '#ffffff' },
          SnacksInputBorder = { fg = '#4c4c4c' },

          SnacksIndent = { fg = '#4c4c4c' },
          SnacksIndentScope = { fg = '#abb2bf' },
          SnacksIndentUnderline_SnacksIndentScope = { fg = '#abb2bf' },

          SnacksDashboardDesc = { fg = '#ffffff' },
          SnacksDashboardDir = { fg = '#4c4c4c' },
          SnacksDashboardHeader = { fg = '#c18efe' },
          SnacksDashboardFooter = { fg = '#c18efe' },
          SnacksDashboardIcon = { fg = '#c18efe' },
          SnacksDashboardFile = { fg = '#ffffff' },
          SnacksDashboardTitle = { fg = '#ffffff' },
          -- snacksdashboardspecial = { fg = '#ff657e' },
          SnacksDashboardNormal = { fg = '#4c4c4c' }, --4b4f6b

          -- noice
          NoiceConfirmBorder = { fg = '#4c4c4c' },
          NoiceCmdlinePrompt = { fg = '#4c4c4c' },
          NoiceCmdlinePopupBorder = { fg = '#4c4c4c' },
          NoiceCmdlinePopupTitleCmdline = { fg = '#ffffff' },
          NoiceCmdlinePopupTitle = { fg = '#ffffff' },
          NoiceCmdlineTitle = { fg = '#ffffff' },
          NoiceCmdlineIcon = { fg = '#abb2bf' }, --#ffffff
          NoiceCmdlineIconSearch = { fg = '#c18efe' }, --#ffffff

          -- whichkey
          WhichkeyTitle = { fg = '#abb2bf' },
          WhichkeyGroup = { fg = '#abb2bf' },

          -- fzf
          FzfLuaBorder = { fg = '#4c4c4c' },
          FzfLuaHeaderText = { fg = '#abb2bf' },
          FzfLuaDirIcon = { fg = '#abb2bf' },
          FzfLuaHeaderBind = { fg = '#ffffff' },
          FzfLuaTabTitle = { fg = '#ffffff' },
          FzfLuaSearch = { fg = '#ffffff' },

          -- nvim tree
          nvimtreenormal = { bg = transparent_background and 'none' or '#1a1a1a' },
          nvimtreeendofbuffer = { fg = '#1a1a1a', bg = nil }, -- fundo para o final do buffer no nvimtree
          nvimtreeemptyfoldername = { fg = '#666666' }, -- nome de pastas vazias no nvimtree
          nvimtreeopenedfoldername = { fg = '#579fdc' }, -- nome de pastas abertas no nvimtree
          nvimtreefoldername = { fg = '#aaaaaa' }, -- nome de pastas no nvimtree

          bufferlinefill = { bg = '#1a1a1a' }, -- cor de fundo do bufferline
        },
      }
      set_theme(default_theme)
    end,
  },
  {
    'catppuccin/nvim',
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
            BufferLineFill = { bg = '#181827' },

            FloatBorder = { fg = '#6BB8FF' },
            Border = { fg = '#4c4c4c' },
            FloatShadow = { fg = '#4c4c4c' },
            VertSplit = { fg = '#4c4c4c' },
            CursorLine = { bg = '#45475C' },
            Underlined = { bg = '#45475C' },

            SnacksPicker = { bg = transparent_background and 'NONE' or '#181826' },
            SnacksPickerBorder = { fg = '#7DB6FF', bg = transparent_background and 'NONE' or '#181826' },

            TreesitterContext = { bg = transparent_background and 'NONE' or '#181826', fg = '#45475C' },
            TreesitterContextLineNumber = { bg = transparent_background and 'NONE' or '#181826', fg = '#45475C' },
            TreesitterContextBottom = { sp = '#45475c', underline = true },

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
  {
    'ellisonleao/gruvbox.nvim',
    config = function() end,
  },
  {
    'luisiacc/gruvbox-baby',
    config = function() end,
  },

  {
    'datsfilipe/vesper.nvim',
    config = function()
      local transparent_background = false
      require('vesper').setup {
        transparent = transparent_background,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },
        overrides = {
          Directory = { fg = '#DAE7EC' }, --#A1BCC5

          Normal = { fg = '#abb2bf', bg = transparent_background and 'none' or '#101010' }, --#202020 #000000 #0D0D0D
          EndOfBuffer = { fg = '#101010', bg = 'none' },
          NormalFloat = { bg = transparent_background and 'none' or '#101010' },
          VertSplit = { fg = transparent_background and '#101010' or '#101010' },

          Visual = { bg = transparent_background and '#4c4c4c' or '#606060' },
          CursorLine = { bg = '#323232' },
          CursorLineNr = { fg = '#C6C6C6' },
          SignColumn = { bg = '#323232' },
          LineNr = { fg = '#727272' }, --#4b5263 #727272
          FloatBorder = { fg = '#323232' },
          Border = { fg = '#101010' },
          FloatShadow = { fg = '#101010' },
          Search = { bg = '#606060', fg = '#abb2bf' },
          IncSearch = { bg = '#606060', fg = '#FFCDA2' },
          Underlined = { bg = nil },
          winbarnc = { fg = '#202020', bg = '#202020' }, -- barra de janelas não ativa
          MatchParen = { fg = '#abb2bf' },
          NonText = { fg = '#727272' },
          Title = { fg = '#FFFFFF' },
          Comment = { fg = '#585858' },
          Question = { fg = '#FFFFFF' },
          --underline cmp preview
          ['@markup.heading.1.markdown'] = { fg = '#323232' },

          -- ['@punctuation.bracket'] = { fg = '#323232' },

          -- Avante
          AvanteInlineHint = { fg = '#606060' }, --#abb2bf
          -- Keyword = { fg = '#606060' }, --#abb2bf

          --Punctuation Special
          ['@punctuation.special'] = { fg = transparent_background and '#323232' or '#323232' },
          ['@punctuation.special.bash'] = { fg = '#62747F' },
          ['@punctuation.special.python'] = { fg = '#62747F' },
          ['@punctuation.special.htmldjango'] = { fg = '#FED600' },
          ['@punctuation.special.javascript'] = { fg = '#62747F' },
          ['@punctuation.special.typescript'] = { fg = '#62747F' },
          ['@punctuation.special.go'] = { fg = '#62747F' },
          ['@punctuation.special.elixir'] = { fg = '#62747F' },
          ['@punctuation.special.c'] = { fg = '#62747F' },
          ['@punctuation.special.lua'] = { fg = '#62747F' },
          ['@punctuation.special.php'] = { fg = '#62747F' },
          ['@punctuation.special.json'] = { fg = '#62747F' },

          --number
          Number = { fg = '#FFCDA2' },

          --punctuation
          ['@punctuation'] = { fg = '#ffffff' },

          --variable
          -- ['@variable'] = { fg = '#BCBBBB' },
          -- ['@variable.builtin'] = { fg = '#BCBBBB' },

          --constant
          -- ['@constant'] = { fg = '#B3B2B3' },

          --bash
          -- ['@string.bash'] = { fg = '#BAB9BA' },
          -- ['@number.bash'] = { fg = '#BAB9BA' },
          -- ['@variable.bash'] = { fg = '#BAB9BA' },
          -- ['@constant.bash'] = { fg = '#F67582' },

          --module
          -- ['@module'] = { fg = '#B6B5B6' },

          --constructor
          -- ['@constructor'] = { fg = '#c18efe' },

          --Documentation
          ['@string.documentation'] = { fg = '#585858' },

          --html
          -- ['@none.html'] = { fg = '#B0AFB0' },
          -- ['@markup.heading.1.html'] = { fg = '#AAA9AA' },
          -- ['@markup.heading.2.html'] = { fg = '#AAA9AA' },
          -- ['@markup.heading.3.html'] = { fg = '#AAA9AA' },
          -- ['@markup.heading.4.html'] = { fg = '#AAA9AA' },
          -- ['@markup.heading.5.html'] = { fg = '#AAA9AA' },
          -- ['@markup.heading.6.html'] = { fg = '#AAA9AA' },

          --htmldjango
          -- ['@punctuation.special.htmldjango'] = { fg = '#FED600' },
          -- ['@variable.htmldjango'] = { fg = '#92A4B6' },
          -- ['@function.htmldjango'] = { fg = '#F67582' },
          -- ['@keyword.repeat.htmldjango'] = { fg = '#F67582' },
          -- ['@keyword.operator.htmldjango'] = { fg = '#F67582' },

          --Telescope
          TelescopeBorder = { fg = '#ffffff' },
          TelescopePreviewBorder = { fg = '#4c4c4c' },
          TelescopePromptBorder = { fg = '#4c4c4c' },
          TelescopeResultsBorder = { fg = '#4c4c4c' },

          --todo
          TodoBgTODO = { bg = '#64baff', fg = '#111111', bold = true },
          TodoBgNOTE = { bg = '#c18efe', fg = '#111111', bold = true },
          TodoBgWARN = { bg = '#ffa868', fg = '#111111', bold = true },
          TodoBgFIX = { bg = '#F67582', fg = '#111111', bold = true },
          TodoFgTODO = { fg = '#64baff' },
          TodoFgNOTE = { fg = '#c18efe' },
          TodoFgWARN = { fg = '#ffa868' },
          TodoFgFIX = { fg = '#F67582' },
          -- todobghack = { bg = '#c18efe', fg = '#111111', bold = true },
          -- todofghack = { fg = '#c18efe' },

          --diagnostic
          -- diagnosticerror = { fg = '#be5046' },
          DiagnosticWarn = { fg = '#ffa868' },
          DiagnosticInfo = { fg = '#64baff' },
          DiagnosticHint = { fg = '#c18efe' },

          -- snacks notifier
          SnacksNotifierBorderInfo = { fg = '#4c4c4c' },
          SnacksNotifierBorderWarn = { fg = '#ffa868' },
          SnacksNotifierBorderError = { fg = '#F67582' },
          SnacksNotifierTitleInfo = { fg = '#ffffff' },

          SnacksPickerTitle = { fg = '#ffffff', bg = '#1A1A1A' },
          SnacksPickerInputTitle = { fg = '#abb2bf', bg = transparent_background and 'none' or '#1A1A1A' }, --explorer
          SnacksPickerBorder = { fg = transparent_background and '#101010' or '#101010', bg = transparent_background and 'none' or '#101010' }, --#323232
          SnacksPickerToggle = { fg = '#abb2bf', bg = '#1A1A1A' },

          SnacksPicker = { bg = transparent_background and 'none' or '#101010' },
          -- SnacksPicker = { bg = '#1A1A1A' },
          -- SnacksPickerBorder = { fg = '#323232', bg = '#1A1A1A' },

          SnacksInputIcon = { fg = '#abb2bf' }, --#ff657e
          SnacksInputTitle = { fg = '#ffffff' },
          SnacksInputBorder = { fg = '#4c4c4c' },

          SnacksIndent = { fg = '#4c4c4c' },
          SnacksIndentScope = { fg = '#abb2bf' },
          SnacksIndentUnderline_SnacksIndentScope = { fg = '#abb2bf' },

          SnacksDashboardDesc = { fg = '#ffffff' },
          SnacksDashboardDir = { fg = '#4c4c4c' },
          SnacksDashboardHeader = { fg = '#60DCC1' },
          SnacksDashboardFooter = { fg = '#60DCC1' },
          SnacksDashboardIcon = { fg = '#60DCC1' },
          SnacksDashboardFile = { fg = '#ffffff' },
          SnacksDashboardTitle = { fg = '#ffffff' },
          -- snacksdashboardspecial = { fg = '#ff657e' },
          SnacksDashboardNormal = { fg = '#4b4f6b' }, --4b4f6b

          -- noice
          NoiceConfirmBorder = { fg = '#4c4c4c' },
          NoiceCmdlinePrompt = { fg = '#4c4c4c' },
          NoiceCmdlinePopupBorder = { fg = '#4c4c4c' },
          NoiceCmdlinePopupTitleCmdline = { fg = '#ffffff' },
          NoiceCmdlinePopupTitle = { fg = '#ffffff' },
          NoiceCmdlineTitle = { fg = '#ffffff' },
          NoiceCmdlineIcon = { fg = '#abb2bf' }, --#ffffff
          NoiceCmdlineIconSearch = { fg = '#FFCDA2' }, --#ffffff

          -- whichkey
          WhichkeyTitle = { fg = '#abb2bf' },
          WhichkeyGroup = { fg = '#abb2bf' },

          -- fzf
          FzfLuaBorder = { fg = '#4c4c4c' },
          FzfLuaHeaderText = { fg = '#abb2bf' },
          FzfLuaDirIcon = { fg = '#abb2bf' },
          FzfLuaHeaderBind = { fg = '#ffffff' },
          FzfLuaTabTitle = { fg = '#ffffff' },
          FzfLuaSearch = { fg = '#ffffff' },

          -- nvim tree
          nvimtreenormal = { bg = transparent_background and 'none' or '#1a1a1a' },
          nvimtreeendofbuffer = { fg = '#1a1a1a', bg = nil }, -- fundo para o final do buffer no nvimtree
          nvimtreeemptyfoldername = { fg = '#666666' }, -- nome de pastas vazias no nvimtree
          nvimtreeopenedfoldername = { fg = '#579fdc' }, -- nome de pastas abertas no nvimtree
          nvimtreefoldername = { fg = '#aaaaaa' }, -- nome de pastas no nvimtree

          bufferlinefill = { bg = '#1a1a1a' }, -- cor de fundo do bufferline
        },
      }
    end,
  },
}
