return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
    -- { 'nvim-telescope/telescope.nvim', lazy = true }, -- opcional
    { 'neovim/nvim-lspconfig', lazy = true }, -- opcional
  },
  opts = {
    document_color = {
      enabled = true,
      kind = 'inline', -- "inline" | "foreground" | "background"
      inline_symbol = '󰝤 ', --󰝤  
      debounce = 200,
    },

    conceal = {
      enabled = false,
      min_length = nil,
      symbol = '󱏿',
      highlight = {
        fg = '#38BDF8',
      },
    },

    cmp = {
      highlight = 'foreground', -- "foreground" | "background"
    },

    telescope = {
      utilities = {
        callback = function(name, class) end,
      },
    },

    extension = {
      queries = {}, -- filetypes com queries personalizadas de classe
      patterns = {
        -- rust = { "class=[\"']([^\"']+)[\"']" },
        -- javascript = { "clsx%(([^)]+)%)" },
      },
    },
  },
}
