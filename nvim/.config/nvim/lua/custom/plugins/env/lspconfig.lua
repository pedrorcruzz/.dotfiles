return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    { 'williamboman/mason.nvim', lazy = true },
    { 'williamboman/mason-lspconfig.nvim', lazy = true },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', lazy = true },

    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    -- { 'j-hui/fidget.nvim', opts = {} },

    { 'folke/neodev.nvim', opts = {}, lazy = true },
    { 'folke/neoconf.nvim', opts = {}, lazy = true },
    -- {
    --   'SmiteshP/nvim-navic',
    --   opts = {
    --     lsp = {
    --       auto_attach = true,
    --       preference = {
    --         ['typescript-tools'] = 2,
    --         ['tsserver'] = 1,
    --       },
    --     },
    --   },
    --   lazy = true,
    -- },
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- map('gd', '<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>', 'Goto Definition')
        -- map('<leader>lg', '<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>', 'Goto Definition')
        -- map('gr', '<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<cr>', 'Goto References')
        -- map('gI', '<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>', 'Goto Implementation')
        -- map('<leader>lD', '<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<cr>', 'Type Definition')

        map('<leader>lr', vim.lsp.buf.rename, 'Rename')
        map('<leader>ld', '<cmd>FzfLua lsp_finder<cr>', 'Find Definition')
        map('<leader>la', vim.lsp.buf.code_action, 'Code Action')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- INFO: if u use nvim-cmp, uncomment the line below
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      intelephense = {
        filetypes = { 'php' },
        root_pattern = { 'composer.json', '.git', '.php' },
      },
      emmet_language_server = {
        filetypes = {
          'html',
          'htmldjango',
          'javascriptreact',
          'typescriptreact',
          'vue',
          'blade',
          'heex',
          'eelixr',
        },
      },
      -- lua_ls = {
      --   settings = {
      --     Lua = {
      --       runtime = { version = 'LuaJIT' },
      --       diagnostics = { globals = { 'vim' } },
      --       workspace = {
      --         library = vim.api.nvim_get_runtime_file('', true),
      --         checkThirdParty = false,
      --       },
      --     },
      --   },
      -- },
      tailwindcss = {
        filetypes = { 'html', 'jsx', 'tsx' }, -- Apenas jsx, tsx e html
        root_pattern = {
          'tailwind.config.js',
          'tailwind.config.ts',
          'postcss.config.js',
          'postcss.config.ts',
          'package.json',
          'node_modules',
          '.git',
        },
        init_options = {
          userLanguages = {
            elixir = 'html-eex',
            eelixir = 'html-eex',
            heex = 'html-eex',
          },
        },
        settings = {
          tailwindCSS = {
            lint = {
              cssConflict = 'warning',
              invalidApply = 'error',
              invalidConfigPath = 'error',
              invalidScreen = 'error',
              invalidTailwindDirective = 'error',
              invalidVariant = 'error',
              recommendedVariantOrder = 'warning',
            },
            experimental = {
              classRegex = {
                [[class= "([^"]*)]],
                [[class: "([^"]*)]],
                '~H""".*class="([^"]*)".*"""',
                '~F""".*class="([^"]*)".*"""',
                '"([^"]*)"',
              },
            },
            validate = true,
          },
        },
      },
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
        end,
        settings = {
          json = {
            format = { enable = true },
            validate = { enable = true },
          },
        },
      },
    }

    require('mason').setup {
      ui = {
        border = 'rounded',
      },
    }
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      --Formatters
      'stylua',
      'superhtml',
      'prettierd',
      'autopep8',
      'sql-formatter',
      -- 'php-cs-fixer',
      'blade-formatter',
      'goimports',
      'google-java-format',
      -- Linters
      'djlint',
      --LSP
      'django-template-lsp',
      'pyright',
      'gopls',
      'emmet-language-server',
      'tailwindcss-language-server',
      'typescript-language-server',
      'intelephense',
      'jdtls',
      'sqlls',
      -- Debuggers
      'php-debug-adapter',
      'go-debug-adapter',
      'debugpy',
      'java-debug-adapter',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          if server_name == 'tsserver' then
            server_name = 'ts_ls'
          end
          local opts = vim.tbl_deep_extend('force', {}, server, { capabilities = capabilities })
          require('lspconfig')[server_name].setup(opts)
        end,
      },
    }

    vim.diagnostic.config {
      -- virtual_text = { true },
      -- virtual_text = { current_line = true },
      virtual_lines = { true },
      -- virtual_lines = { current_line = true },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
          [vim.diagnostic.severity.INFO] = ' ',
        },
      },
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    }
  end,
}
