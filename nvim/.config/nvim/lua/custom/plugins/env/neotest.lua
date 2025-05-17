return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            args = { "--log-level", "DEBUG" },
            runner = "pytest",
            python = ".venv/bin/python",
            is_test_file = function(file_path) end,
            pytest_discover_instances = true,
          }),

          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
    keys = {
      { "<leader>nr", "<cmd>Neotest run<cr>", desc = "NeoTest: Run" },
      { "<leader>ns", "<cmd>Neotest stop<cr>", desc = "NeoTest: Stop" },
      { "<leader>nj", "<cmd>Neotest jump<cr>", desc = "NeoTest: Jump" },
      { "<leader>na", "<cmd>Neotest attach<cr>", desc = "NeoTest: Attach" },
      { "<leader>no", "<cmd>Neotest output<cr>", desc = "NeoTest: Output" },
      { "<leader>np", "<cmd>Neotest output-panel<cr>", desc = "NeoTest: Output Panel" },
      { "<leader>nh", "<cmd>Neotest summary<cr>", desc = "NeoTest: Summary" },
    },
  },
}
