return {
  {
    -- Instalar o plugin nvim-dap para depuração
    "mfussenegger/nvim-dap",
    dependencies = {

      -- Cria uma interface de depuração bonita
      "rcarriga/nvim-dap-ui",

      -- Python
      {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
          "mfussenegger/nvim-dap",
          "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
          local path = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
          require("dap-python").setup(path)
        end,
      },

      -- Dependência obrigatória para o nvim-dap-ui
      "nvim-neotest/nvim-nio",

      -- Instala os adaptadores de depuração para você
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          -- Garantir que os pacotes necessários sejam instalados
          opts.ensure_installed = {
            "js-debug-adapter",
            "debugpy",
            "delve",
          }
        end,
      },

      "jay-babu/mason-nvim-dap.nvim",
      -- Adicione seus próprios depuradores aqui
      "leoluz/nvim-dap-go",
    },
    opts = function()
      local dap = require("dap")

      -- Configuração para o adaptador de node (JavaScript/TypeScript)
      if not dap.adapters["pwa-node"] then
        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              require("mason-registry").get_package("js-debug-adapter"):get_install_path()
                .. "/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }
      end

      -- Adicionando configurações para JavaScript e TypeScript
      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              runtimeExecutable = "ts-node",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            },
          }
        end
      end

      -- Configuração para Python/Django
      if not dap.adapters.python then
        dap.adapters.python = {
          type = "server",
          host = "localhost",
          port = 5678, -- Porta padrão do debugpy
          executable = {
            command = "python",
            args = { "-m", "debugpy.adapter" },
          },
        }
      end

      for _, language in ipairs({ "python" }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            -- Configuração para rodar o servidor Django
            {
              type = "python",
              request = "launch",
              name = "Launch Django server",
              program = "${workspaceFolder}/manage.py", -- Caminho para o arquivo manage.py do Django
              args = { "runserver", "127.0.0.1:8000" }, -- Inicia o servidor Django
              pythonPath = function()
                return vim.fn.input("Python path: ", vim.fn.getenv("VIRTUAL_ENV") .. "/bin/python", "file")
              end,
            },
            -- Configuração para rodar o shell do Django
            {
              type = "python",
              request = "launch",
              name = "Launch Django shell",
              program = "${workspaceFolder}/manage.py",
              args = { "shell" }, -- Abre o shell Django para depuração
              pythonPath = function()
                return vim.fn.input("Python path: ", vim.fn.getenv("VIRTUAL_ENV") .. "/bin/python", "file")
              end,
            },
            -- Configuração para anexar ao processo Django já em execução
            {
              type = "python",
              request = "attach",
              name = "Attach to Django process",
              processId = require("dap.utils").pick_process,
            },
          }
        end
      end
    end,

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Keymaps para depuração
      vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Debug: Start/Continue" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<leader>dd", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Debug: Set Breakpoint" })

      -- Configuração da interface do DAP
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
          },
        },
      })

      -- Tecla para alternar a interface do DAP
      vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close

      -- Configuração para depuração em Go (caso necessário)
      require("dap-go").setup()
    end,
  },
}
