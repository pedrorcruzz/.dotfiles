return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    local has_exe = function(exe)
      return vim.fn.executable(exe) == 1
    end

    local js_linters = {}
    if has_exe 'eslint_d' then
      table.insert(js_linters, 'eslint_d')
    end
    if has_exe 'eslint' then
      table.insert(js_linters, 'eslint')
    end
    if has_exe 'biomejs' then
      table.insert(js_linters, 'biomejs')
    end

    lint.linters_by_ft = {
      markdown = { 'markdownlint' },
      elixir = { 'credo' },
      javascript = js_linters,
      typescript = js_linters,
      typescriptreact = js_linters,
      javascriptreact = js_linters,
      python = { 'pylint' },
      php = { 'phpcs' },
      dockerfile = { 'hadolint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
