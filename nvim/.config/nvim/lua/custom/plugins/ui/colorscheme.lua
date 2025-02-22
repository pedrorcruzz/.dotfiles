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
          Normal = { bg = transparent_background and 'none' or '#202020' },
          Visual = { bg = transparent_background and '#4c4c4c' or '#606060' },
          -- cursorline = { bg = transparent_background and "none" or "#323232" },
          CursorLine = { bg = '#323232' },
          LineNr = { fg = '#4b5263' },
          NormalFloat = { fg = '#abb2bf', bg = transparent_background and 'none' or '#202020' },
          FloatBorder = { fg = '#4c4c4c' },
          FloatShadow = { fg = '#4c4c4c' },
          Search = { bg = '#606060', fg = '#abb2bf' },
          IncSearch = { bg = '#606060', fg = '#ff657e' },
          AvanteInlineHint = { fg = '#abb2bf' },
          EndOfBuffer = { fg = '#1A1A1A', bg = 'none' },
          Underlined = { bg = nil },

          MatchParen = { fg = '#abb2bf' },
          ['@markup.heading.1.markdown'] = { fg = '#abb2bf' },
          --underline cmp preview
          ['@punctuation.special'] = { fg = '#323232' },

          --variable
          ['@variable'] = { fg = '#BCBBBB' },
          ['@variable.builtin'] = { fg = '#BCBBBB' },

          --constant
          ['@constant'] = { fg = '#B3B2B3' },

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
          ['@function.htmldjango'] = { fg = '#ff657e' },
          ['@keyword.repeat.htmldjango'] = { fg = '#ff657e' },
          ['@keyword.operator.htmldjango'] = { fg = '#ff657e' },

          --todo
          TodoBgTODO = { bg = '#64baff', fg = '#111111', bold = true },
          TodoBgNOTE = { bg = '#c18efe', fg = '#111111', bold = true },
          TodoBgWARN = { bg = '#ffa868', fg = '#111111', bold = true },
          TodoBgFIX = { bg = '#ff657e', fg = '#111111', bold = true },
          TodoFgTODO = { fg = '#64baff' },
          TodoFgNOTE = { fg = '#c18efe' },
          TodoFgWARN = { fg = '#ffa868' },
          TodoFgFIX = { fg = '#ff657e' },
          -- todobghack = { bg = '#c18efe', fg = '#111111', bold = true },
          -- todofghack = { fg = '#c18efe' },

          --diagnostic
          -- diagnosticerror = { fg = '#be5046' },
          DiagnosticWarn = { fg = '#ffa868' },
          DiagnosticInfo = { fg = '#64baff' },
          DiagnosticHint = { fg = '#c18efe' },
          --
          -- snacks notifier
          SnacksNotifierBorderInfo = { fg = '#4c4c4c' },
          SnacksNotifierBorderWarn = { fg = '#ffa868' },
          SnacksNotifierBorderError = { fg = '#ff657e' },
          SnacksNotifierTitleInfo = { fg = '#ffffff' },

          SnacksPickerTitle = { fg = '#ffffff' },
          SnacksPickerInputTitle = { fg = '#abb2bf' },
          SnacksPickerToggle = { fg = '#abb2bf' },

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

          winbarnc = { fg = '#202020', bg = '#202020' }, -- barra de janelas não ativa
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
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { 'italic' },
          functions = { 'bold' },
          keywords = { 'italic' },
        },
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
