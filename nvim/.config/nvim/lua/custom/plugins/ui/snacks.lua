return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
        {
          section = "terminal",
          cmd = "ascii-image-converter ~/.config/nvim/lua/custom/plugins/ui/dashboard_img/hq.png -C -c",
          random = 10,
          pane = 2,
          indent = 4,
          height = 30,
        },
      },
    },
    explorer = {
      enabled = true,
      cycle = false,
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 2000,
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true,
      sort = { "level", "added" },
      level = vim.log.levels.TRACE,
      style = "compact",
      top_down = true,
      date_format = "%R",
      more_format = " ↓ %d lines ",
      refresh = 50,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    -- scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("snacks").explorer()
      end,
      desc = "Open Snacks Explorer",
    },

    {
      "<leader>;",
      function()
        require("snacks").dashboard()
      end,
      desc = "Home",
    },

    {
      "<leader>gg",
      function()
        require("snacks").lazygit()
      end,
      desc = "LazyGit",
    },
    {
      "<leader>lf",
      function()
        require("snacks").rename.rename_file()
      end,
      desc = "LSP: Rename current file",
    },
  },
}
