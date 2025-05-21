return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',

      -- Python
      {
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        dependencies = {
          'mfussenegger/nvim-dap',
          'rcarriga/nvim-dap-ui',
        },
        config = function()
          local path = vim.fn.expand '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
          require('dap-python').setup(path)
        end,
      },

      'nvim-neotest/nvim-nio',

      {
        'williamboman/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = {
            'js-debug-adapter',
            'debugpy',
            'delve',
          }
        end,
      },

      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },

    opts = function()
      local dap = require 'dap'
      local mason_registry_ok, mason_registry = pcall(require, 'mason-registry')
      local js_debug_adapter_path = nil

      if mason_registry_ok and mason_registry.has_package 'js-debug-adapter' then
        local js_debug_adapter = mason_registry.get_package 'js-debug-adapter'
        js_debug_adapter_path = js_debug_adapter:get_install_path()
      else
        vim.notify('[nvim-dap] js-debug-adapter package not found or Mason registry not ready yet', vim.log.levels.WARN)
      end

      if not dap.adapters['pwa-node'] and js_debug_adapter_path then
        dap.adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            args = {
              js_debug_adapter_path .. '/js-debug/src/dapDebugServer.js',
              '${port}',
            },
          },
        }
      end

      for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
        dap.configurations[language] = dap.configurations[language]
          or {
            {
              type = 'pwa-node',
              request = 'launch',
              name = 'Launch file',
              program = '${file}',
              runtimeExecutable = 'ts-node',
              cwd = '${workspaceFolder}',
            },
            {
              type = 'pwa-node',
              request = 'attach',
              name = 'Attach',
              processId = require('dap.utils').pick_process,
              cwd = '${workspaceFolder}',
            },
          }
      end

      -- Django/Python
      if not dap.adapters.python then
        dap.adapters.python = {
          type = 'server',
          host = 'localhost',
          port = 5678,
          executable = {
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
          },
        }
      end

      for _, language in ipairs { 'python' } do
        dap.configurations[language] = dap.configurations[language]
          or {
            {
              type = 'python',
              request = 'launch',
              name = 'Launch Django server',
              program = '${workspaceFolder}/manage.py',
              args = { 'runserver', '127.0.0.1:8000' },
              pythonPath = function()
                return vim.fn.input('Python path: ', (vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV .. '/bin/python') or 'python', 'file')
              end,
            },
            {
              type = 'python',
              request = 'launch',
              name = 'Launch Django shell',
              program = '${workspaceFolder}/manage.py',
              args = { 'shell' },
              pythonPath = function()
                return vim.fn.input('Python path: ', (vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV .. '/bin/python') or 'python', 'file')
              end,
            },
            {
              type = 'python',
              request = 'attach',
              name = 'Attach to Django process',
              processId = require('dap.utils').pick_process,
            },
          }
      end
    end,

    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      require('dap-go').setup()
    end,

    keys = {
      {
        '<leader>ds',
        function()
          require('dap').continue()
        end,
        desc = 'Debug: Start/Continue',
        mode = 'n',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug: Step Into',
        mode = 'n',
      },
      {
        '<leader>dd',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug: Step Over',
        mode = 'n',
      },
      {
        '<leader>do',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug: Step Out',
        mode = 'n',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Debug: Toggle Breakpoint',
        mode = 'n',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
        mode = 'n',
      },
      {
        '<F7>',
        function()
          require('dapui').toggle()
        end,
        desc = 'Debug: See last session result.',
        mode = 'n',
      },
    },
  },
}
