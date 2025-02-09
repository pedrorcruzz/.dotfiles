return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "p", desc = "Projects", action = ":NeovimProjectDiscover" },
          { icon = " ", key = "f", desc = "Find File", action = ":FzfLua files" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":FzfLua oldfiles" },
          { icon = " ", key = "w", desc = "Worktree", action = ":Yazi cwd" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = function()
              require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
            end,
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = {
          [[
██████╗  ██████╗ ███████╗ █████╗     ███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔══██╗██╔═══██╗██╔════╝██╔══██╗    ████╗  ██║██║   ██║██║████╗ ████║
██████╔╝██║   ██║███████╗███████║    ██╔██╗ ██║██║   ██║██║██╔████╔██║
██╔══██╗██║   ██║╚════██║██╔══██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██║╚██████╔╝███████║██║  ██║    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        },
        formats = {
          icon = function(item)
            if item.file and item.icon == "file" or item.icon == "directory" then
              return M.icon(item.file, item.icon)
            end
            return { item.icon, width = 2, hl = "icon" }
          end,
          footer = { "%s", align = "center" },
          header = { "%s", align = "center" },
          file = function(item, ctx)
            local fname = vim.fn.fnamemodify(item.file, ":~")
            fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
            if #fname > ctx.width then
              local dir = vim.fn.fnamemodify(fname, ":h")
              local file = vim.fn.fnamemodify(fname, ":t")
              if dir and file then
                file = file:sub(-(ctx.width - #dir - 2))
                fname = dir .. "/…" .. file
              end
            end
            local dir, file = fname:match("^(.*)/(.+)$")
            return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
          end,
        },
      },
      sections = {
        { pane = 1, { section = "header" }, gap = 0 },
        {
          pane = 2,
          section = "terminal",
          cmd = "chafa ~/.config/nvim/lua/custom/plugins/ui/dashboard_img/luffy-gear-5.jpeg --format symbols --size 70x70;",
          -- cmd = "ascii-image-converter ~/.config/nvim/lua/custom/plugins/ui/dashboard_img/luffy-gear-5.jpeg -C -c -d 60,30",
          height = 25,
          padding = 1,
        },
        {
          pane = 1,
          icon = " ",
          -- title = "Config",
          section = "keys",
          indent = 1,
          gap = 0,
          padding = 1,
          { section = "startup" },
        },
        -- {
        --   pane = 2,
        --   icon = " ",
        --   title = "Recent Files",
        --   section = "recent_files",
        --   limit = 10,
        --   indent = 2,
        -- },
      },
      width = 70,
    },
    explorer = {
      enabled = true,
      cycle = false,
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    toggle = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 1, right = 1, bottom = 1 },
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
    scroll = { enabled = true },
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
      desc = "Snacks: LazyGit",
    },
    {
      "<leader>lf",
      function()
        require("snacks").rename.rename_file()
      end,
      desc = "Snacks: Rename current file",
    },
  },
}
