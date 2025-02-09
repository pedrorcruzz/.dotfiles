return {
  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup({
      win = {
        border = "double", -- none, single, double, shadow
      },
    })

    -- Document existing key chains
    require("which-key").add({
      { "<leader>", group = " 󰧵 ROSA NVIM" },
      { "<leader>e", group = "File Explorer", icon = "" },
      { "<leader>'", group = "Wrap", icon = "󰭷" },
      { "<leader>v", group = "Auto Save", icon = "" },
      { "<leader>b", group = "DBUI", icon = "" },
      { "<leader>x", group = "Mini Explorer", icon = "" },
      { "<leader>n", group = "Neotest", icon = "" },
      { "<leader>y", group = "Yazi", icon = "" },
      { "<leader>;", group = "Home", icon = "" },
      { "<leader>w", group = "Save", icon = "" },
      { "<leader>[", group = "Previous", icon = "󰙣" },
      { "<leader>h", group = "No Highlight", icon = "󰸱" },
      { "<leader>]", group = "Next", icon = "󰙡" },
      { "<leader>a", group = "Avante", icon = "" },
      { "<leader>l", group = "LSP", icon = "" },
      { "<leader>o", group = "Harpoon", icon = "󱝩" },
      { "<leader>m", group = "Window", icon = "󰶛" },
      { "<leader>p", group = "Copilot", icon = "" },
      { "<leader>d", group = "Debug" },
      { "<leader>d_", hidden = true },
      { "<leader>f", group = "Find" },
      { "<leader>p_", hidden = true },
      { "<leader>g", group = "Git", icon = { name = "git", cat = "filetype" } },
      { "<leader>r", group = "Refactor" },
      { "<leader>s", group = "Search" },
    })
  end,

  keys = {
    { "<leader>w", "<cmd>w!<cr>", desc = "Save" },
    { "<leader>c", "<cmd>close<cr>", desc = "Close Window" },
    -- { "<leader>;", "<cmd>Dashboard<cr>", desc = "Home" },
    { "<leader>h", "<cmd>nohlsearch<cr>", desc = "No Highlight" },
    { "<leader>q", "<cmd>confirm q<cr>", desc = "Exit" },

    --Wrap
    { "<leader>'e", "<cmd>:set wrap<cr>", desc = "Wrap: Enable" },
    { "<leader>'d", "<cmd>Dashboard<cr>", desc = "Wrap: Disable" },

    -- Yazi
    -- { "<leader>y", "<cmd>Yazi<cr>", desc = "Yazi" },

    --Bufers
    { "<leader>[", "<cmd>bprevious<cr>", desc = "Previous" },
    { "<leader>]", "<cmd>bnext<cr>", desc = "Next" },

    -- Neotest
    -- { "<leader>nr", "<cmd>NeoTest run<cr>", desc = "Run" },
    -- { "<leader>ns", "<cmd>NeoTest stop<cr>", desc = "Stop" },
    -- { "<leader>nj", "<cmd>NeoTest jump<cr>", desc = "Jump" },
    -- { "<leader>na", "<cmd>NeoTest attach<cr>", desc = "Attach" },
    -- { "<leader>no", "<cmd>NeoTest output<cr>", desc = "Output" },
    -- { "<leader>np", "<cmd>NeoTest output-panel<cr>", desc = "Output Panel" },
    -- { "<leader>nh", "<cmd>NeoTest summary<cr>", desc = "Summary" },

    --Git
    { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Git: Commits" },
    -- { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Git: LazyGit" },
    { "<leader>gb", "<cmd>FzfLua git_branches<CR>", desc = "Git: Branches" },
    { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Git: Status" },
    { "<leader>gl", "<cmd>FzfLua git_blame<CR>", desc = "Git: Blame" },
    { "<leader>gt", "<cmd>FzfLua git_stash<CR>", desc = "Git: Stash" },

    -- Nvim-tree
    -- { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },

    --Window
    { "<leader>mq", "<cmd>vsplit<cr>", desc = "Split Vertical" },
    { "<leader>mn", "<cmd>split<cr>", desc = "Split Horizontal" },
    { "<leader>mc", "<cmd>only<cr>", desc = "Close all Others" },
    { "<leader>mh", "<cmd>wincmd H<cr>", desc = "Swap Left" },
    { "<leader>ml", "<cmd>wincmd L<cr>", desc = "Swap Right" },
    { "<leader>mk", "<cmd>wincmd K<cr>", desc = "Swap Up" },
    { "<leader>mj", "<cmd>wincmd J<cr>", desc = "Swap Down" },
    { "<leader>mm", "<cmd>MaximizerToggle<cr>", desc = "Maximizer" },
    {
      "<leader>m1",
      function()
        vim.cmd("vertical resize " .. math.floor(vim.o.columns / 3))
      end,
      desc = "Resize Left 1/3",
    },
    {
      "<leader>m2",
      function()
        vim.cmd("vertical resize " .. math.floor(vim.o.columns * 2 / 3))
      end,
      desc = "Resize Right 2/3",
    },
    {
      "<leader>m3",
      function()
        vim.cmd("resize " .. math.floor(vim.o.lines / 3))
      end,
      desc = "Resize Up 1/3",
    },
    {
      "<leader>m4",
      function()
        vim.cmd("resize " .. math.floor(vim.o.lines * 2 / 3))
      end,
      desc = "Resize Down 2/3",
    },
    { "<leader>mr", "<cmd>resize | vertical resize | wincmd =", desc = "Reset Window Sizes" },
  },
}
