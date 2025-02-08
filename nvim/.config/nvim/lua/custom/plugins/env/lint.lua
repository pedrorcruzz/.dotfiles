return {

   { -- Linting
      'mfussenegger/nvim-lint',
      event = { 'BufReadPre', 'BufNewFile' },
      config = function()
         local lint = require 'lint'
         lint.linters_by_ft = {
            markdown = { 'markdownlint' },
            elixir = { 'credo' },
            typescript = { 'eslint', "biome" },
            typescriptreact = { 'eslint', "biome" },
            python = { 'pylint' },
            ruby = { "rubocop" },
            php = { "phpcs" },
            codespell = { "codespell", "cspell" },
            dockerfile = { "hadolint" },
            json = { "jsonlint" },
         }

         -- Função para verificar se o linter está disponível
         local function linter_exists(linter)
            return vim.fn.executable(linter) == 1
                or vim.fn.filereadable(vim.fn.getcwd() .. "/node_modules/.bin/" .. linter) == 1
         end

         -- Criando autocomando para rodar o linting
         local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
         vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
               local ft = vim.bo.filetype
               local linters = lint.linters_by_ft[ft]

               if linters then
                  for _, linter in ipairs(linters) do
                     if linter_exists(linter) then
                        lint.try_lint()
                        break
                     end
                  end
               end
            end,
         })

         -- Mapeamento de tecla para acionar o lint manualmente
         -- vim.keymap.set('n', '<leader>L', function()
         --    local ft = vim.bo.filetype
         --    local linters = lint.linters_by_ft[ft]

         --    if linters then
         --       for _, linter in ipairs(linters) do
         --          if linter_exists(linter) then
         --             lint.try_lint()
         --             break
         --          end
         --       end
         --    end
         -- end, { desc = "Trigger linting for current file" })
      end,
   },
}

