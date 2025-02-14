return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      win = {
        border = 'single', -- none, single, double, shadow
      },
    }

    -- Document existing key chains
    require('which-key').add {
      { '<leader>', group = ' 󰠥 ROSA NVIM' }, --󰧵
      { '<leader>e', group = 'File Explorer', icon = '' },
      { "<leader>'", group = 'Wrap', icon = '󰭷' },
      { '<leader>z', group = 'Obsidian', icon = '' },
      { '<leader>v', group = 'Auto Save', icon = '' },
      { '<leader>b', group = 'DBUI', icon = '' },
      { '<leader>x', group = 'Mini Explorer', icon = '' },
      { '<leader>n', group = 'Neotest', icon = '' },
      { '<leader>y', group = 'Yazi', icon = '' },
      { '<leader>;', group = 'Home', icon = '' },
      { '<leader>w', group = 'Save', icon = '' },
      { '<leader>[', group = 'Previous', icon = '󰙣' },
      { '<leader>h', group = 'No Highlight', icon = '󰸱' },
      { '<leader>]', group = 'Next', icon = '󰙡' },
      { '<leader>a', group = 'Avante', icon = '' },
      { '<leader>l', group = 'LSP', icon = '' },
      { '<leader>o', group = 'Harpoon', icon = '󱝩' },
      { '<leader>m', group = 'Window', icon = '󰶛' },
      { '<leader>c', group = 'Tabs', icon = '󱦞' },
      { '<leader>p', group = 'Copilot', icon = '' },
      { '<leader>d', group = 'Debug' },
      { '<leader>d_', hidden = true },
      { '<leader>f', group = 'Find' },
      { '<leader>p_', hidden = true },
      { '<leader>g', group = 'Git', icon = { name = 'git', cat = 'filetype' } },
      { '<leader>r', group = 'Refactor' },
      { '<leader>s', group = 'Search' },
      { '<leader>1', group = 'Focus Left', icon = '󰛁' },
      { '<leader>2', group = 'Focus Right', icon = '󰛂' },
      { '<leader>3', group = 'Focus Down', icon = '󰛀' },
      { '<leader>4', group = 'Focus Up', icon = '󰛃' },
    }
  end,

  keys = {
    { '<leader>w', '<cmd>w!<cr>', desc = 'Save' },
    -- { '<leader>c', '<cmd>close<cr>', desc = 'Close Window' },
    -- { "<leader>;", "<cmd>Dashboard<cr>", desc = "Home" },
    { '<leader>h', '<cmd>nohlsearch<cr>', desc = 'No Highlight' },
    { '<leader>q', '<cmd>confirm q<cr>', desc = 'Exit' },

    --Wrap
    { "<leader>'", '<cmd>:set wrap<cr>', desc = 'Wrap' },

    -- Yazi
    -- { "<leader>y", "<cmd>Yazi<cr>", desc = "Yazi" },

    --Obsidian

    { '<leader>zo', '<cmd>e ~/Workspace/second-brain/Segundo\\ Cérebro.md<cr>', desc = 'Open Obsidian Neovim' },
    { '<leader>zO', '<cmd>ObsidianOpen<cr>', desc = 'Open Obisidian' },
    { '<leader>zd', '<cmd>ObsidianToday<cr>', desc = 'Daily Note' },
    { '<leader>zf', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Find Note' },
    { '<leader>zs', '<cmd>ObsidianSearch<cr>', desc = 'Search Note' },
    { '<leader>zr', '<cmd>ObsidianRename<cr>', desc = 'Rename' },
    { '<leader>za', '<cmd>ObsidianNewFromTemplate<cr>', desc = 'Create Note' },
    { '<leader>zm', '<cmd>ObsidianToggleCheckbox<cr>', desc = 'Toggle Checkbox' },
    { '<leader>zp', '<cmd>ObsidianPasteImage<cr>', desc = 'Paste Image' },

    --Bufers
    { '<leader>[', '<cmd>bprevious<cr>', desc = 'Previous' },
    { '<leader>]', '<cmd>bnext<cr>', desc = 'Next' },

    --Tabs
    { '<leader>ca', '<cmd>tabnew<cr>', desc = 'Tabs: New Tab' },
    { '<leader>ch', '<cmd>tabprevious<cr>', desc = 'Tabs: Previous' },
    { '<leader>cl', '<cmd>tabnext<cr>', desc = 'Tabs: Next' },
    { '<leader>cc', '<cmd>tabclose<cr>', desc = 'Tabs: Close' },
    { '<leader>cC', '<cmd>tabonly<cr>', desc = 'Tabs: Close other Tabs' },

    -- Neotest
    -- { "<leader>nr", "<cmd>NeoTest run<cr>", desc = "Run" },
    -- { "<leader>ns", "<cmd>NeoTest stop<cr>", desc = "Stop" },
    -- { "<leader>nj", "<cmd>NeoTest jump<cr>", desc = "Jump" },
    -- { "<leader>na", "<cmd>NeoTest attach<cr>", desc = "Attach" },
    -- { "<leader>no", "<cmd>NeoTest output<cr>", desc = "Output" },
    -- { "<leader>np", "<cmd>NeoTest output-panel<cr>", desc = "Output Panel" },
    -- { "<leader>nh", "<cmd>NeoTest summary<cr>", desc = "Summary" },

    --Git
    -- { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = 'Git: Commits' },
    { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'Git: LazyGit' },
    { '<leader>gt', '<cmd>Gitsigns toggle_current_line_blame<CR>', desc = 'Git: Toggle Current Line Blame' },
    -- { '<leader>gb', '<cmd>FzfLua git_branches<CR>', desc = 'Git: Branches' },
    -- { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Git: Status' },
    -- { '<leader>gl', '<cmd>FzfLua git_blame<CR>', desc = 'Git: Blame' },
    -- { '<leader>gt', '<cmd>FzfLua git_stash<CR>', desc = 'Git: Stash' },

    -- Nvim-tree
    -- { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },

    --Window
    { '<leader>1', '<cmd>wincmd h<cr>', desc = 'Focus Left' },
    { '<leader>2', '<cmd>wincmd l<cr>', desc = 'Focus Right' },
    { '<leader>3', '<cmd>wincmd j<cr>', desc = 'Focus Down' },
    { '<leader>4', '<cmd>wincmd k<cr>', desc = 'Focus Up' },
    { '<leader>mq', '<cmd>vsplit<cr>', desc = 'Split Vertical' },
    { '<leader>mn', '<cmd>split<cr>', desc = 'Split Horizontal' },
    { '<leader>mc', '<cmd>only<cr>', desc = 'Close all Others' },
    { '<leader>mh', '<cmd>wincmd H<cr>', desc = 'Swap Left' },
    { '<leader>ml', '<cmd>wincmd L<cr>', desc = 'Swap Right' },
    { '<leader>mk', '<cmd>wincmd K<cr>', desc = 'Swap Up' },
    { '<leader>mj', '<cmd>wincmd J<cr>', desc = 'Swap Down' },
    { '<leader>mm', '<cmd>MaximizerToggle<cr>', desc = 'Maximizer' },
    {
      '<leader>m1',
      function()
        vim.cmd('vertical resize ' .. math.floor(vim.o.columns / 3))
      end,
      desc = 'Resize Left 1/3',
    },
    {
      '<leader>m2',
      function()
        vim.cmd('vertical resize ' .. math.floor(vim.o.columns * 2 / 3))
      end,
      desc = 'Resize Right 2/3',
    },
    {
      '<leader>m3',
      function()
        vim.cmd('resize ' .. math.floor(vim.o.lines / 3))
      end,
      desc = 'Resize Up 1/3',
    },
    {
      '<leader>m4',
      function()
        vim.cmd('resize ' .. math.floor(vim.o.lines * 2 / 3))
      end,
      desc = 'Resize Down 2/3',
    },
    { '<leader>mr', '<cmd>resize | vertical resize | wincmd =<cr>', desc = 'Reset Window Sizes' },
  },
}
