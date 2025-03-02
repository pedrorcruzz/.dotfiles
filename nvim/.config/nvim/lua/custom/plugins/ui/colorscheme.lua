local function set_theme(theme)
  vim.cmd('colorscheme ' .. theme)
end

local default_theme = 'min-theme'

return {
  {
    'datsfilipe/min-theme.nvim',
    config = function()
      local transparent_background = true
      require('min-theme').setup {
        theme = 'dark',
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
          Normal = { fg = '#abb2bf', bg = transparent_background and 'none' or '#202020' },
          Visual = { bg = transparent_background and '#4c4c4c' or '#606060' },
          CursorLine = { bg = '#323232' },
          CursorLineNr = { fg = '#C6C6C6' },
          SignColumn = { bg = '#323232' },
          LineNr = { fg = '#727272' }, --#4b5263
          NormalFloat = { bg = transparent_background and 'none' or '#202020' },
          FloatBorder = { fg = '#4c4c4c' },
          Border = { fg = '#4c4c4c' },
          FloatShadow = { fg = '#4c4c4c' },
          Search = { bg = '#606060', fg = '#abb2bf' },
          IncSearch = { bg = '#606060', fg = '#F67582' },
          AvanteInlineHint = { fg = '#606060' }, --#abb2bf
          EndOfBuffer = { fg = '#202020', bg = transparent_background and 'none' },
          Underlined = { bg = nil },
          winbarnc = { fg = '#202020', bg = '#202020' }, -- barra de janelas não ativa
          MatchParen = { fg = '#abb2bf' },
          ['@markup.heading.1.markdown'] = { fg = '#abb2bf' },
          --underline cmp preview
          ['@punctuation.special'] = { fg = '#323232' },

          --variable
          ['@variable'] = { fg = '#BCBBBB' },
          ['@variable.builtin'] = { fg = '#BCBBBB' },

          --constant
          ['@constant'] = { fg = '#B3B2B3' },

          --bash
          ['@string.bash'] = { fg = '#BAB9BA' },
          ['@number.bash'] = { fg = '#BAB9BA' },
          ['@variable.bash'] = { fg = '#F67582' },
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

          SnacksPickerTitle = { fg = '#ffffff', bg = '#1A1A1A' },
          SnacksPickerInputTitle = { fg = '#abb2bf', bg = '#1A1A1A' },
          SnacksPickerToggle = { fg = '#abb2bf', bg = '#1A1A1A' },
          -- SnacksPicker = { bg = transparent_background and 'none' or '#1A1A1A' },
          SnacksPicker = { bg = '#1A1A1A' },
          -- SnacksPickerBorder = { fg = '#323232', bg = transparent_background and 'none' or '#1A1A1A' },
          SnacksPickerBorder = { fg = '#323232', bg = '#1A1A1A' },

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
          SnacksDashboardNormal = { fg = '#4b4f6b' }, --4b4f6b

          -- noice
          NoiceConfirmBorder = { fg = '#4c4c4c' },
          NoiceCmdlinePrompt = { fg = '#4c4c4c' },
          NoiceCmdlinePopupBorder = { fg = '#4c4c4c' },
          NoiceCmdlinePopupTitleCmdline = { fg = '#ffffff' },
          NoiceCmdlinePopupTitle = { fg = '#ffffff' },
          NoiceCmdlineTitle = { fg = '#ffffff' },
          NoiceCmdlineIcon = { fg = '#abb2bf' }, --#ffffff
          -- NoiceCmdlineIconSearch = { fg = '#abb2bf' }, --#ffffff

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
      require('catppuccin').setup {
        background = { light = 'latte', dark = 'mocha' },
        transparent_background = true,
        term_colors = true,
        styles = {
          comments = { 'italic' },
          functions = { 'bold' },
          keywords = { 'italic' },
        },
        custom_highlights = function(colors)
          return {
            -- CursorLine = { bg = '#45475C' },

            -- Snacks
            SnacksPicker = { bg = '#181826' },
            SnacksPickerBorder = { fg = '#7DB6FF', bg = '#181826' },

            ['@punctuation.special'] = { fg = '#4c4c4c' },
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
    'killitar/obscure.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() end,
  },
}
