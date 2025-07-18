return {
  'pmizio/typescript-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local util = require 'lspconfig.util'
    local root_dir = util.root_pattern('biome.json', '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json', 'eslint.config.js')

    local has_custom_linter = root_dir(vim.fn.getcwd()) ~= nil

    require('typescript-tools').setup {
      on_attach = function(client, bufnr) end,

      handlers = {},

      settings = {
        separate_diagnostic_server = not has_custom_linter,
        publish_diagnostic_on = 'change', --save insert_leave change
        expose_as_code_action = {},

        tsserver_path = nil,
        tsserver_plugins = {},

        tsserver_max_memory = 'auto',
        tsserver_format_options = {},
        tsserver_file_preferences = {},

        tsserver_locale = 'en',
        complete_function_calls = false,
        include_completions_with_insert_text = true,

        code_lens = 'off',
        disable_member_code_lens = true,

        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    }
  end,
}
