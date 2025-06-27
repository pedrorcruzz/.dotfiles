return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },

  {
    'moyiz/blink-emoji.nvim',
    ft = { 'markdown', 'norg', 'gitcommit' },
  },

  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        local luasnip = require 'luasnip'
        luasnip.filetype_extend('typescriptreact', { 'javascript' })
        luasnip.filetype_extend('typescript', { 'javascript' })
        luasnip.filetype_extend('vue', { 'vue' })
        luasnip.filetype_extend('django', { 'django' })
        luasnip.filetype_extend('django', { 'python' })
        require('luasnip.loaders.from_vscode').lazy_load()

        require 'config.snippets.typescript'
        require 'config.snippets.typescriptreact'
        require 'config.snippets.javascript'
        require 'config.snippets.javascriptreact'
      end,

      'mikavilpas/blink-ripgrep.nvim',
      'folke/snacks.nvim',
      {
        'ray-x/cmp-sql',
        lazy = true,
        ft = { 'sql', 'mysql', 'plsql' },
      },

      {
        'kristijanhusak/vim-dadbod-completion',
        lazy = true,
        ft = { 'sql', 'mysql', 'plsql' },
      },
    },
    version = '1.*',

    -- -@module 'blink.cmp'
    -- -@type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        preset = 'none',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-j>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<S-k>'] = { 'select_prev', 'fallback' },
        ['<S-j>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },

      appearance = {
        nerd_font_variant = 'mono',
      },
      signature = {
        enabled = true,
        window = { border = 'rounded' }, -- 'rounded' | 'single' | 'double' | 'solid' | 'shadow' | 'none'
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = 'solid' }, -- 'rounded' | 'single' | 'double' | 'solid' | 'shadow' | 'none'
        },
        ghost_text = {
          enabled = false,
        },
        menu = {
          icons = {
            lsp = '',
            copilot = '',
            path = '',
            snippets = '',
            buffer = '﬘',
            ripgrep = '',
            emoji = 'ﲃ',
            sql = '',
          },
          border = 'solid', -- 'rounded' | 'single' | 'double' | 'solid' | 'shadow' | 'none'
          scrollbar = false,
          draw = {
            treesitter = { 'lsp' },
          },
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep', 'emoji', 'sql' },

        providers = {
          ripgrep = {
            module = 'blink-ripgrep',
            name = 'Ripgrep',
            opts = {
              prefix_min_len = 3,
              context_size = 5,
              max_filesize = '1M',
              project_root_marker = '.git',
              project_root_fallback = true,
              search_casing = '--ignore-case',
              additional_rg_options = {},
              fallback_to_regex_highlighting = true,
              ignore_paths = {},
              additional_paths = {},
              toggles = {
                on_off = nil,
                debug = nil,
              },
              future_features = {
                backend = { use = 'ripgrep' },
              },
              debug = false,
            },
            transform_items = function(_, items)
              for _, item in ipairs(items) do
                item.labelDetails = { description = '(rg)' }
              end
              return items
            end,
          },

          emoji = {
            module = 'blink-emoji',
            name = 'Emoji',
            score_offset = 15,
            opts = { insert = true },

            should_show_items = function()
              return vim.tbl_contains({ 'gitcommit', 'markdown', 'norg' }, vim.o.filetype)
            end,
          },

          vim_dadbod = {
            name = 'vim-dadbod-completion',
            module = 'blink.compat.source',
            opts = {},
            should_show_items = function()
              return vim.tbl_contains({ 'sql', 'mysql', 'plsql' }, vim.o.filetype)
            end,
          },

          sql = {
            name = 'sql',
            module = 'blink.compat.source',
            score_offset = -3,
            opts = {},
            should_show_items = function()
              return vim.tbl_contains({ 'sql' }, vim.o.filetype)
            end,
          },
        },

        -- keymap = {
        --   ['<c-g>'] = function()
        --     require('blink-cmp').show { providers = { 'ripgrep' } }
        --   end,
        -- },
      },

      filetype = {
        ['htmldjango'] = { 'lsp', 'snippets', 'buffer', 'path' },
        ['sql'] = { 'vim_dadbod', 'sql', 'buffer' },
        ['mysql'] = { 'vim_dadbod', 'sql', 'buffer' },
        ['plsql'] = { 'vim_dadbod', 'sql', 'buffer' },
        ['markdown'] = { 'emoji', 'buffer' },
        ['norg'] = { 'emoji', 'buffer' },
        ['gitcommit'] = { 'emoji', 'buffer' },
      },

      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },

    opts_extend = { 'sources.default' },
  },
}
