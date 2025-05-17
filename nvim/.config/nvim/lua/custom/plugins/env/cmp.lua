return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
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
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim',
      'kristijanhusak/vim-dadbod-completion',
      {
        'roobert/tailwindcss-colorizer-cmp.nvim',
        config = function()
          require('tailwindcss-colorizer-cmp').setup {
            color_square_width = 2,
          }
        end,
      },
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'
      local types = require 'cmp.types'
      local str = require 'cmp.utils.str'

      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<S-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ['<S-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<c-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'copilot' },
          { name = 'neorg' },
        },
        experimental = {
          ghost_text = false,
        },
        formatting = {
          expandable_indicator = false,
          fields = {
            cmp.ItemField.Abbr,
            cmp.ItemField.Kind,
            cmp.ItemField.Menu,
            cmp.ItemField.Info,
          },
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 60,
            before = function(entry, vim_item)
              vim_item.menu = ({
                copilot = '',
                nvim_lsp = '',
                nvim_lua = '',
                treesitter = '',
                path = 'ﱮ',
                buffer = '﬘',
                zsh = '',
                vsnip = '',
                spell = '暈',
                emoji = 'ﲃ',
              })[entry.source.name]

              local word = entry:get_insert_text()
              word = str.oneline(word)
              if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet and string.sub(vim_item.abbr, -1, -1) == '~' then
                word = word .. '~'
              end
              vim_item.abbr = word
              vim_item = require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)

              return vim_item
            end,
          },
          sorting = {
            priority_weight = 2,
            comparators = {
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.score,
              cmp.config.compare.recently_used,
              cmp.config.compare.locality,
              cmp.config.compare.kind,
              cmp.config.compare.sort_text,
              cmp.config.compare.length,
              cmp.config.compare.order,
            },
          },
        },
        window = {
          completion = {
            border = 'rounded',
            winhighlight = 'Normal:Pmenu,NormalNC:Pmenu',
            col_offset = 0,
            side_padding = 1,
            scrollbar = false,
          },
          documentation = {
            border = 'rounded',
            winhighlight = 'Normal:Pmenu,NormalNC:Pmenu',
            scrollbar = false,
          },
        },
      }
      --DBUI SQL
      cmp.setup.filetype({ 'sql', 'mysql', 'plsql' }, {
        sources = {
          { name = 'vim-dadbod-completion' },
          { name = 'buffer' },
        },
      })

      --Django
      cmp.setup.filetype({ 'htmldjango' }, {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })
    end,
  },
}
