return {
  {
    "stevearc/conform.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier", "biome", "biome-check" },
          typescript = { "prettier", "biome", "biome-check" },
          html = { "prettier" },
          css = { "prettier" },
          javascriptreact = { "prettier", "biome", "biome-check" },
          typescriptreact = { "prettier", "biome", "biome-check" },
          python = { "black", "autopep8" },
          ruby = { "rubocop" },
          lua = { "stylua" },
          php = { "php_cs_fixer" }, --[[ "phpcbf" ]]
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })
      -- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      --    conform.format({
      --       lsp_fallback = true,
      --       async = false,
      --       timeout_ms = 500,
      --    })
      -- end, { desc = "Format current file" })
    end,
  },
}
