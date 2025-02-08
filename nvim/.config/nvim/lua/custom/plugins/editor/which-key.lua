return {
  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()

    -- Document existing key chains
    require("which-key").add({
      { "<leader>f", group = "Find" },
      { "<leader>f_", hidden = true },
      { "<leader>t", group = "Terminal" },
      { "<leader>t_", hidden = true },
      { "<leader>p", group = "Pane" },
      { "<leader>p_", hidden = true },
      { "<leader>h", group = "Hover Git Actions", icon = { name = "git", cat = "filetype" } },
      { "<leader>h_", hidden = true },
      { "<leader>g", group = "Git", icon = { name = "git", cat = "filetype" } },
      { "<leader>g_", hidden = true },
      { "<leader>l", group = "LSP" },
      print({ "<leader>o", group = "Harpoon" }),
      { "<leader>o_", hidden = true },
      { "<leader>r_", hidden = true },
      { "<leader>s", group = "Search" },
      { "<leader>s_", hidden = true },
    })
  end,

  keys = {
    { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
    { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
    { "<leader>w", "<cmd>w!<cr>", desc = " Save" },
    { "<leader>c", "<cmd>close<cr>", desc = "Close Window" },
    { "<leader>;", "<cmd>Dashboard<cr>", desc = " Rosa Nvim" },
    { "<leader>q", "<cmd>confirm q<cr>", desc = "Exit" },

    --Bufers
    { "<leader>[", "<cmd>bprevious<cr>", desc = "󰙣 Previous" },
    { "<leader>]", "<cmd>bnext<cr>", desc = "󰙡 Next" },

    -- Nvim-tree
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },

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
