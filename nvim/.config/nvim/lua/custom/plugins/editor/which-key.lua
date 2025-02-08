return {
  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()

    -- Document existing key chains
    require("which-key").add({
      { "<leader>e", group = "File Explorer", icon = "" },
      { "<leader>n", group = "Neotest", icon = "" },
      { "<leader>y", group = "Yazi", icon = "" },
      { "<leader>;", group = "Home", icon = "" },
      { "<leader>w", group = "Save", icon = "" },
      { "<leader>[", group = "Previous", icon = "󰙣" },
      { "<leader>]", group = "Next", icon = "󰙡" },
      { "<leader>a", group = "Avante", icon = "" },
      { "<leader>l", group = "LSP", icon = "" },
      { "<leader>o", group = "Harpoon", icon = "󱝩" },
      { "<leader>p", group = "Pane", icon = "󰶛" },
      { "<leader>d", group = "Debug" },
      { "<leader>d_", hidden = true },
      { "<leader>f", group = "Find" },
      { "<leader>p_", hidden = true },
      { "<leader>h", group = "Hover Git Actions", icon = { name = "git", cat = "filetype" } },
      { "<leader>g", group = "Git", icon = { name = "git", cat = "filetype" } },
      { "<leader>r", group = "Refactor" },
      { "<leader>s", group = "Search" },
    })
  end,

  keys = {
    { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
    { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
    { "<leader>w", "<cmd>w!<cr>", desc = "Save" },
    { "<leader>c", "<cmd>close<cr>", desc = "Close Window" },
    { "<leader>;", "<cmd>Dashboard<cr>", desc = "Home" },
    { "<leader>q", "<cmd>confirm q<cr>", desc = "Exit" },

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

    -- Nvim-tree
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },

    --Pane
    { "<leader>pq", "<cmd>vsplit<cr>", desc = "Split Vertical" },
    { "<leader>pn", "<cmd>split<cr>", desc = "Split Horizontal" },
    { "<leader>pc", "<cmd>only<cr>", desc = "Close all Others" },
    { "<leader>ph", "<cmd>wincmd H<cr>", desc = "Swap Left" },
    { "<leader>pl", "<cmd>wincmd L<cr>", desc = "Swap Right" },
    { "<leader>pk", "<cmd>wincmd K<cr>", desc = "Swap Up" },
    { "<leader>pj", "<cmd>wincmd J<cr>", desc = "Swap Down" },
    { "<leader>pm", "<cmd>MaximizerToggle<cr>", desc = "Maximizer" },
    {
      "<leader>p1",
      function()
        vim.cmd("vertical resize " .. math.floor(vim.o.columns / 3))
      end,
      desc = "Resize Left 1/3",
    },
    {
      "<leader>p2",
      function()
        vim.cmd("vertical resize " .. math.floor(vim.o.columns * 2 / 3))
      end,
      desc = "Resize Right 2/3",
    },
    {
      "<leader>p3",
      function()
        vim.cmd("resize " .. math.floor(vim.o.lines / 3))
      end,
      desc = "Resize Up 1/3",
    },
    {
      "<leader>p4",
      function()
        vim.cmd("resize " .. math.floor(vim.o.lines * 2 / 3))
      end,
      desc = "Resize Down 2/3",
    },
    { "<leader>pr", "<cmd>resize | vertical resize | wincmd =", desc = "Reset Window Sizes" },
  },
}
