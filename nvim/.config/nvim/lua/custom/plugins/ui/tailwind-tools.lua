-- tailwind-tools.lua
return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    -- 'nvim-telescope/telescope.nvim', -- opcional
    'neovim/nvim-lspconfig', -- opcional
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
        callback = function(name, class)
          -- callback ao selecionar classe utilitária no Telescope
        end,
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
