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
          Normal = { bg = transparent_background and 'NONE' or '#202020' },
          Visual = { bg = transparent_background and '#4c4c4c' or '#606060' },
          -- CursorLine = { bg = transparent_background and "NONE" or "#323232" },
          CursorLine = { bg = '#323232' },
          LineNr = { fg = '#4B5263' },
          NormalFloat = { fg = '#ABB2BF', bg = transparent_background and 'NONE' or '#202020' },
          FloatBorder = { fg = '#4c4c4c' },
          Search = { bg = '#606060', fg = '#ABB2BF' },
          IncSearch = { bg = '#606060', fg = '#FF657E' },
          AvanteInlineHint = { fg = '#ABB2BF' },

          ['@markup.heading.1.markdown'] = { fg = '#ABB2BF' },
          --UNDERLINE CMP PREVIEW
          ['@punctuation.special'] = { fg = '#323232' },

          --TODO
          TodoBgTODO = { bg = '#64BAFF', fg = '#111111', bold = true },
          TodoBgNOTE = { bg = '#C18EFE', fg = '#111111', bold = true },
          TodoBgWARN = { bg = '#FFA868', fg = '#111111', bold = true },
          TodoBgFIX = { bg = '#FF657E', fg = '#111111', bold = true },
          -- TodoBgHACK = { bg = '#C18EFE', fg = '#111111', bold = true },

          --Diagnostic
          -- DiagnosticError = { fg = '#BE5046' },
          DiagnosticWarn = { fg = '#FFA868' },
          DiagnosticInfo = { fg = '#64BAFF' },
          DiagnosticHint = { fg = '#C18EFE' },
          TodoFgTODO = { fg = '#64BAFF' },
          TodoFgNOTE = { fg = '#C18EFE' },
          TodoFgWARN = { fg = '#FFA868' },
          TodoFgFIX = { fg = '#FF657E' },
          -- TodoFgHACK = { fg = '#C18EFE' },
          --
          -- Snacks Notifier
          SnacksNotifierBorderInfo = { fg = '#4c4c4c' },
          SnacksNotifierBorderWarn = { fg = '#FFA868' },
          SnacksNotifierBorderError = { fg = '#FF657E' },
          SnacksNotifierTitleInfo = { fg = '#FFFFFF' },

          SnacksPickerTitle = { fg = '#FFFFFF' },
          SnacksPickerInputTitle = { fg = '#ABB2BF' },
          SnacksPickerToggle = { fg = '#ABB2BF' },

          SnacksInputIcon = { fg = '#ABB2BF' }, --#FF657E
          SnacksInputTitle = { fg = '#FFFFFF' },
          SnacksInputBorder = { fg = '#4c4c4c' },

          SnacksIndent = { fg = '#4c4c4c' },
          SnacksIndentScope = { fg = '#ABB2BF' },
          SnacksIndentUnderline_SnacksIndentScope = { fg = '#ABB2BF' },

          SnacksDashboardDesc = { fg = '#FFFFFF' },
          SnacksDashboardDir = { fg = '#4c4c4c' },
          SnacksDashboardHeader = { fg = '#FF657E' },
          SnacksDashboardFooter = { fg = '#FF657E' },
          SnacksDashboardIcon = { fg = '#FF657E' },
          SnacksDashboardFile = { fg = '#FFFFFF' },
          SnacksDashboardTitle = { fg = '#FFFFFF' },
          -- SnacksDashboardSpecial = { fg = '#FF657E' },
          SnacksDashboardNormal = { fg = '#111111' },

          -- Noice
          NoiceConfirmBorder = { fg = '#4c4c4c' },
          NoiceCmdlinePrompt = { fg = '#4c4c4c' },
          NoiceCmdlinePopupBorder = { fg = '#4c4c4c' },
          NoiceCmdlinePopupTitleCmdline = { fg = '#FFFFFF' },
          NoiceCmdlinePopupTitle = { fg = '#FFFFFF' },
          NoiceCmdlineTitle = { fg = '#FFFFFF' },
          NoiceCmdlineIcon = { fg = '#ABB2BF' }, --#FFFFFF

          -- WhichKey
          WhichKeyTitle = { fg = '#ABB2BF' },
          WhichKeyGroup = { fg = '#ABB2BF' },

          -- FZF
          FzfLuaBorder = { fg = '#4c4c4c' },
          FzfLuaHeaderText = { fg = '#ABB2BF' },
          FzfLuaDirIcon = { fg = '#ABB2BF' },
          FzfLuaHeaderBind = { fg = '#FFFFFF' },
          FzfLuaTabTitle = { fg = '#FFFFFF' },
          FzfLuaSearch = { fg = '#FFFFFF' },

          -- NVIM TREE
          NvimTreeNormal = { bg = transparent_background and 'NONE' or '#1A1A1A' },
          NvimTreeEndOfBuffer = { fg = '#1A1A1A', bg = nil }, -- Fundo para o final do buffer no NvimTree
          NvimTreeEmptyFolderName = { fg = '#666666' }, -- Nome de pastas vazias no NvimTree
          NvimTreeOpenedFolderName = { fg = '#579FDC' }, -- Nome de pastas abertas no NvimTree
          NvimTreeFolderName = { fg = '#AAAAAA' }, -- Nome de pastas no NvimTree

          WinBarNC = { fg = '#202020', bg = '#202020' }, -- Barra de janelas não ativa
          BufferLineFill = { bg = '#1A1A1A' }, -- Cor de fundo do BufferLine
          EndOfBuffer = { fg = '#202020', bg = 'NONE' }, -- Garantindo que o final do buffer seja transparente
          Underlined = { bg = nil }, -- Sublinhado
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
      }
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    config = function() end,
  },
  {
    'Mofiqul/dracula.nvim',
    config = function() end,
  },
  {
    'killitar/obscure.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() end,
  },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() end,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() end,
  },
}
