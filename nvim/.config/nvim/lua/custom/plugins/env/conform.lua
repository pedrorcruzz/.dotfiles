return {
  {
    'stevearc/conform.nvim',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    config = function()
      local conform = require 'conform'

      conform.setup {
        formatters_by_ft = {
          javascript = { 'biome', 'prettierd', 'prettier', 'biome-check' },
          typescript = { 'biome', 'prettierd', 'prettier', 'biome-check' },
          html = { 'prettierd', 'prettier' },
          css = { 'prettierd', 'prettier' },
          htmldjango = { 'djlint' },
          javascriptreact = { 'biome', 'prettierd', 'prettier', 'biome-check' },
          typescriptreact = { 'biome', 'prettierd', 'prettier', 'biome-check' },
          python = { 'black', 'autopep8' },
          ruby = { 'rubocop' },
          lua = { 'stylua' },
          php = { 'php_cs_fixer' }, --[[ "phpcbf" ]]
          go = { 'gofmt' },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      }
      vim.keymap.set({ 'n', 'v' }, '<leader>lf', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end, { desc = 'Format current file' })
    end,
  },
}
