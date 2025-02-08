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
      { "<leader>nr", "<cmd>NeoTest run<cr>", desc = "Run" },
      { "<leader>ns", "<cmd>NeoTest stop<cr>", desc = "Stop" },
      { "<leader>nj", "<cmd>NeoTest jump<cr>", desc = "Jump" },
      { "<leader>na", "<cmd>NeoTest attach<cr>", desc = "Attach" },
      { "<leader>no", "<cmd>NeoTest output<cr>", desc = "Output" },
      { "<leader>np", "<cmd>NeoTest output-panel<cr>", desc = "Output Panel" },
      { "<leader>nh", "<cmd>NeoTest summary<cr>", desc = "Summary" },
    },
  },
}
