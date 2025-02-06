return {
   {
      "datsfilipe/min-theme.nvim",
      config = function()
         local transparent_background = true
         require('min-theme').setup({
            theme = 'dark',                                  -- Escolha entre 'dark' ou 'light'
            transparent_background = transparent_background, -- Ativa o fundo transparente
            italics = {
               comments = true,                              -- Itálico para comentários
               keywords = true,                              -- Itálico para palavras-chave
               functions = true,                             -- Itálico para funções
               strings = true,                               -- Itálico para strings
               variables = true,                             -- Itálico para variáveis
            },
            overrides = {
               Normal = { bg = transparent_background and 'NONE' or '#202020' },     -- Cor do fundo
               Visual = { bg = transparent_background and 'NONE' or '#606060' },     -- Cor da seleção
               CursorLine = { bg = transparent_background and 'NONE' or '#323232' }, -- Linha do cursor
               -- Adicione outras customizações conforme necessário...
            },
         })
         vim.cmd("colorscheme min-theme") -- Aplica o tema
      end
   },
   {
      "catppuccin/nvim",
      config = function()
         -- Se você quiser configurar o Catppuccin, você pode seguir o modelo acima.
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
}

