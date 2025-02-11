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

          -- FZF
          FzfLuaBorder = { fg = '#4c4c4c' },

          -- SNACKS
          SnacksIndent = { fg = '#4c4c4c' },
          SnacksIndentScope = { fg = '#ABB2BF' },
          SnacksIndentBlank = { fg = '#ABB2BF' },

          SnacksNotifierBorderInfo = { fg = '#444d4c' },
          SnacksNotifierBorderWarn = { fg = '#c69a71' },
          SnacksNotifierBorderError = { fg = '#BE5046' },

          SnacksInputBorder = { fg = '#4c4c4c' },
          SnacksInputTitle = { fg = '#ABB2BF' },
          SnacksInputIcon = { fg = '#FF657E' },

          SnacksPickerInputBorder = { fg = '#4c4c4c', bg = transparent_background and 'NONE' or '#181818' },
          SnacksPicker = { bg = transparent_background and 'NONE' or '#181818' },
          SnacksPickerPreviewTitle = { fg = '#FF657E' },
          SnacksPickerTitle = { fg = '#ABB2BF' },
          SnacksPickerAuEvent = { fg = '#ABB2BF' },
          SnacksPickerLinkBroken = { fg = '#ABB2BF' },

          -- Which Key
          WhichKeyTitle = { fg = '#FFFFFF' },
          WhichKeyGroup = { fg = '#FF657E' }, --#FF657E #C18EFE
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
      vim.cmd 'colorscheme min-theme' -- Aplica o tema
    end,
  },
  {
    'catppuccin/nvim',
    config = function()
      local transparent_background = true
      require('catppuccin').setup {
        background = { light = 'latte', dark = 'mocha' },
        transparent_background = transparent_background, -- Ativa o fundo transparente
        term_colors = true,
        styles = {
          comments = { 'italic' },
          functions = { 'bold' },
          keywords = { 'italic' },
          -- Outras configurações...
        },
      }
      -- vim.cmd 'colorscheme catppuccin'
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
}
