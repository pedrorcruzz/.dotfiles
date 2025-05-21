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
            'debugpy',
            'delve',
            'php-debug-adapter',
            'java-debug-adapter',
          }
        end,
      },

      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },

    opts = function()
      local dap = require 'dap'

      -- Python DAP config
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

      dap.configurations.python = dap.configurations.python
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

      -- Go DAP config (delve)
      if not dap.adapters.go then
        dap.adapters.go = {
          type = 'server',
          port = '${port}',
          executable = {
            command = 'dlv',
            args = { 'dap', '-l', '127.0.0.1:${port}' },
          },
        }
      end

      dap.configurations.go = dap.configurations.go
        or {
          {
            type = 'go',
            name = 'Debug',
            request = 'launch',
            program = '${file}',
          },
          {
            type = 'go',
            name = 'Debug (test file)',
            request = 'launch',
            mode = 'test',
            program = '${file}',
          },
          {
            type = 'go',
            name = 'Attach',
            request = 'attach',
            processId = require('dap.utils').pick_process,
            program = '${file}',
          },
        }

      -- PHP DAP config
      if not dap.adapters.php then
        dap.adapters.php = {
          type = 'executable',
          command = 'php-debug-adapter',
          args = {},
        }
      end

      dap.configurations.php = dap.configurations.php
        or {
          {
            type = 'php',
            request = 'launch',
            name = 'Listen for Xdebug',
            port = 9003,
            pathMappings = {
              ['/var/www/html'] = '${workspaceFolder}',
            },
          },
        }

      -- Java DAP config
      if not dap.adapters.java then
        dap.adapters.java = {
          type = 'server',
          host = '127.0.0.1',
          port = 5005,
        }
      end

      dap.configurations.java = dap.configurations.java
        or {
          {
            type = 'java',
            request = 'attach',
            name = 'Attach to remote',
            hostName = '127.0.0.1',
            port = 5005,
          },
        }
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
