return {
  {
    'williamboman/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      ensure_installed = {
        'ts_ls',
        'tailwindcss',
        'emmet_ls',
        'pyright',
        'intelephense',
        'jsonls',
        'gopls',
        'jdtls',
        'sqlls',
      },
    },
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
      },
      'neovim/nvim-lspconfig',
    },
    config = function(_, opts)
      local lspconfig = require 'lspconfig'
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      -- INFO: if u use nvim-cmp, uncomment the line below
      -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason-lspconfig').setup {
        ensure_installed = opts.ensure_installed,
        handlers = {
          function(server_name)
            local has_custom_config, custom_opts = pcall(require, 'lsp.servers.' .. server_name)
            local server_opts = {}
            if has_custom_config then
              server_opts = custom_opts
            end

            if server_name == 'tsserver' then
              server_name = 'ts_ls'
            end

            local final_opts = vim.tbl_deep_extend('force', {}, server_opts, {
              capabilities = capabilities,
            })

            lspconfig[server_name].setup(final_opts)
          end,
        },
      }
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      ensure_installed = {
        -- Formatters
        'stylua',
        'superhtml',
        'prettierd',
        'autopep8',
        'sql-formatter',
        'blade-formatter',
        'goimports',
        'google-java-format',
        'django-template-lsp',
        -- Linters
        'djlint',
        'eslint_d',
        -- Debuggers
        'php-debug-adapter',
        'go-debug-adapter',
        'debugpy',
        'java-debug-adapter',
      },
    },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
}
