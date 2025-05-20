return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    -- { 'j-hui/fidget.nvim', opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { 'folke/neodev.nvim', opts = {} },
    { 'folke/neoconf.nvim', opts = {} },
    -- {
    --   'b0o/SchemaStore.nvim',
    --   lazy = true,
    --   version = false,
    -- },
    {
      'SmiteshP/nvim-navic',
      opts = {
        lsp = {
          auto_attach = true,
          preference = {
            ['typescript-tools'] = 2,
            ['tsserver'] = 1,
          },
        },
      },
    },
  },

  config = function()
    -- Brief aside: **What is LSP?**
    --
    -- LSP is an initialism you've probably heard, but might not understand what it is.
    --
    -- LSP stands for Language Server Protocol. It's a protocol that helps editors
    -- and language tooling communicate in a standardized fashion.
    --
    -- In general, you have a "server" which is some tool built to understand a particular
    -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
    -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
    -- processes that communicate with some "client" - in this case, Neovim!
    --
    -- LSP provides Neovim with features like:
    --  - Go to definition
    --  - Find references
    --  - Autocompletion
    --  - Symbol Search
    --  - and more!
    --
    -- Thus, Language Servers are external tools that must be installed separately from
    -- Neovim. This is where `mason` and related plugins come into play.
    --
    -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
    -- and elegantly composed help section, `:help lsp-vs-treesitter`

    --  This function gets run when an LSP attaches to a particular buffer.
    --    That is to say, every time a new file is opened that is associated with
    --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    --    function will be executed to configure the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
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

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
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

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- capabilities.textDocument.completion.completionItem.resolveSupport = {
    --   properties = {
    --     'documentation',
    --     'detail',
    --     'additionalTextEdits',
    --   },
    -- }
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. Available keys are:
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
      --
      -- Some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      --
      -- But for many setups, the LSP (`tsserver`) will work just fine
      --

      intelephense = {
        -- init_options = {
        --   licenceKey = '~/intelephense/licence.txt',
        -- },
        filetypes = {
          'php',
        },
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
      lua_ls = {
        -- cmd = {...},
        -- filetypes = { ...},
        -- capabilities = {},

        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },

      tailwindcss = {
        filetypes = {
          'css',
          'scss',
          'sass',
          'html',
          'htmldjango',
          'heex',
          'elixir',
          'eruby',
          -- 'javascript',
          'javascriptreact',
          -- 'typescript',
          'typescriptreact',
          'rust',
          'svelte',
        },
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
          -- tsserver = {
          --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
          -- },
        },
      },
      -- prettierd = {
      --   filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
      -- },
      -- eslint_d = {
      --   filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
      -- },
      -- prettier = {
      --   filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
      -- },
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
        end,
        settings = {
          json = {
            format = {
              enable = true,
            },
            validate = { enable = true },
          },
        },
      },
    }

    -- Ensure the servers and tools above are installed
    --  To check the current status of installed tools and/or manually install
    --  other tools, you can run
    --    :Mason
    --
    --  You can press `g?` for help in this menu.
    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      --Formatters
      'stylua',
      'superhtml',
      'prettierd',
      'black',
      -- 'php-cs-fixer',
      'blade-formatter',
      'goimports',
      'google-java-format',

      -- Linters
      'djlint',

      --LSP
      'django-template-lsp',
      'lua_ls',
      'pyright',
      'gopls',
      'emmet-language-server',
      'tailwindcss-language-server',
      -- 'typescript-language-server',
      'intelephense',
      'jdtls',
      'sqlls',

      -- Debuggers
      'php-debug-adapter',
      'js-debug-adapter',
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
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
          [vim.diagnostic.severity.INFO] = ' ',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
          [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        },
      },
      virtual_text = {
        true,
        current_line = false,
        spacing = 4,
        prefix = '',
        -- prefix = function(diagnostic)
        --   local symbols = {
        --     [vim.diagnostic.severity.ERROR] = '󰅚 ',
        --     [vim.diagnostic.severity.WARN] = '󰀪 ',
        --     [vim.diagnostic.severity.HINT] = '󰌶 ',
        --     [vim.diagnostic.severity.INFO] = ' ',
        --   }
        --   return symbols[diagnostic.severity] or ''
        -- end,
      },
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    }

    -- local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = ' ' }
    -- for type, icon in pairs(signs) do
    --   local hl = 'DiagnosticSign' .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    -- end
    --
    -- vim.diagnostic.config {
    --   virtual_text = {
    --     spacing = 4,
    --     prefix = '',
    --   },
    --   signs = true,
    --   underline = true,
    --   update_in_insert = false,
    --   severity_sort = false,
    -- }
  end,
}
