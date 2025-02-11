return {
  {
    'datsfilipe/min-theme.nvim',
    config = function()
      local transparent_background = true -- Defina como true ou false conforme sua preferência
      require('min-theme').setup {
        theme = 'dark', -- Escolha entre 'dark' ou 'light'
        transparent = transparent_background, -- Aplica a transparência baseado na variável
        italics = {
          comments = true, -- Itálico para comentários
          keywords = true, -- Itálico para palavras-chave
          functions = true, -- Itálico para funções
          strings = true, -- Itálico para strings
          variables = true, -- Itálico para variáveis
        },
        overrides = {
          Normal = { bg = transparent_background and 'NONE' or '#202020' }, -- Cor do fundo
          Visual = { bg = transparent_background and '#4c4c4c' or '#606060' }, -- Cor da seleção
          -- CursorLine = { bg = transparent_background and "NONE" or "#323232" }, -- Linha do cursor
          CursorLine = { bg = '#323232' }, -- Linha do cursor
          LineNr = { fg = '#4B5263' }, -- Gutter foreground
          NormalFloat = { fg = '#ABB2BF', bg = transparent_background and 'NONE' or '#202020' }, -- Cor do float normal
          FloatBorder = { fg = '#4c4c4c' }, -- Cor da borda do float
          Search = { bg = '#606060', fg = '#ABB2BF' }, -- Cor de destaque da busca
          IncSearch = { bg = '#606060', fg = '#FF657E' }, -- Cor de destaque da busca incremental

          -- FZF
          FzfLuaBorder = { fg = '#4c4c4c' }, -- Cor da borda do float
          -- SNACKS
          SnacksIndent = { fg = '#4c4c4c' }, -- Cor do indent guides
          SnacksIndentScope = { fg = '#ABB2BF' },
          SnacksNotifierBorderInfo = { fg = '#444d4c' },
          SnacksNotifierBorderWarn = { fg = '#D19a66' },
          SnacksNotifierBorderError = { fg = '#BE5046' },
          SnacksInputBorder = { fg = '#4c4c4c' },
          SnacksInputTitle = { fg = '#ABB2BF' },
          SnacksInputIcon = { fg = '#FF657E' },
          SnacksIndentBlank = { fg = '#ABB2BF' }, -- Cor do indent guides
          SnacksPickerPreviewTitle = { fg = '#FF657E' }, -- Cor do indent guides
          SnacksPickerTitle = { fg = '#ABB2BF' }, -- Cor do indent guides

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
}
