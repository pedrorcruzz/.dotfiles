return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require 'conform'

      local function has_biome()
        return vim.fn.filereadable(vim.fn.getcwd() .. '/node_modules/.bin/biome') == 1
      end

      conform.setup {
        formatters_by_ft = {
          javascript = has_biome() and { 'biome', 'prettierd', 'prettier' } or { 'prettierd', 'prettier' },
          typescript = has_biome() and { 'biome', 'prettierd', 'prettier' } or { 'prettierd', 'prettier' },
          javascriptreact = has_biome() and { 'biome', 'prettierd' } or { 'prettierd' },
          typescriptreact = has_biome() and { 'biome', 'prettierd' } or { 'prettierd' },
          html = { 'prettierd', 'prettier' },
          css = { 'prettierd', 'prettier' },
          htmldjango = { 'djlint' },
          python = { 'black', 'autopep8' },
          ruby = { 'rubocop' },
          lua = { 'stylua' },
          php = { 'php_cs_fixer' },
          go = { 'goimports' },
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
