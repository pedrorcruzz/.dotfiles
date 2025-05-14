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
      { '<leader>', group = ' 󰠥 ROSAVIM' }, --󰧵
      { '<leader>e', group = 'File Explorer', icon = '' },
      -- { "<leader>'", group = 'Wrap', icon = '󰭷' },
      { '<leader>z', group = 'Obsidian', icon = '' },
      { '<leader>,', group = 'Mini Map', icon = '' },
      { '<leader>vb', group = 'Buffers', icon = '' },
      { '<leader>vt', group = 'Tabs', icon = '' },
      { '<leader>vw', group = 'Windows', icon = '' },
      { '<leader>v', group = 'DBUI', icon = '' },
      { '<leader>b', group = 'BufferLine', icon = '' },
      { '<leader>x', group = 'Explorer Tools', icon = '' },
      { '<leader>n', group = 'Neotest', icon = '' },
      { '<leader>y', group = 'Yazi', icon = '' },
      { '<leader>;', group = 'Home', icon = '' },
      { '<leader>w', group = 'Save', icon = '' },
      { '<leader>W', group = 'Save Without Formatter', icon = '' },
      { '<leader>[', group = 'Previous', icon = '󰙣' },
      { '<leader>h', group = 'No Highlight', icon = '󰸱' },
      { '<leader>]', group = 'Next', icon = '󰙡' },
      { '<leader>a', group = 'Avante', icon = ' ' },
      { '<leader>lx', group = 'Virtual Environment', icon = ' ' },
      { '<leader>lt', group = 'ToggleTerm', icon = ' ' },
      { '<leader>o', group = 'Grapple', icon = '󱝩' },
      -- { '<leader>o', group = 'Harpoon', icon = '󱝩' },
      { '<leader>m', group = 'Codi', icon = '' },

      { '<leader>l', group = 'Tools', icon = ' ' },
      { '<leader>p', group = 'Languages Tools', icon = ' ' },
      { '<leader>pp', group = 'PHP Tools', icon = ' ' },
      { '<leader>pg', group = 'GO Tools', icon = ' ' },
      { '<leader>ps', group = 'Spring Tools', icon = ' ' },
      { '<leader>pgd', group = 'Debug', icon = ' ' },

      { '<leader>c', group = 'Window', icon = '󰶛' },
      { '<leader>t', group = 'Tabs', icon = '󱦞' },

      { '<leader>i', group = 'Copilot', icon = '' },
      { '<leader>u', group = 'Markdown', icon = '' },
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
    { '<leader>W', '<cmd>noa w<cr>', desc = 'Save Without Formatter' },
    -- { '<leader>c', '<cmd>close<cr>', desc = 'Close Window' },
    -- { "<leader>;", "<cmd>Dashboard<cr>", desc = "Home" },
    { '<leader>h', '<cmd>nohlsearch<cr>', desc = 'No Highlight' },
    { '<leader>q', '<cmd>confirm q<cr>', desc = 'Exit' },
    { '<leader>le', '<cmd>GrugFar<cr>', desc = 'GrugFar' },
    { '<leader>lg', '<cmd>TSContextToggle<cr>', desc = 'TSCOntext: Toggle' },
    { '<leader>fp', '<cmd>NeovimProjectDiscover<cr>', desc = 'Discover Projects' },

    --Wrap
    -- { "<leader>'", '<cmd>:set wrap<cr>', desc = 'Wrap' },

    --Obsidian

    { '<leader>zo', '<cmd>e ~/Workspace/second-brain/Segundo\\ Cérebro.md<cr>', desc = 'Open Obsidian Neovim' },
    { '<leader>zO', '<cmd>ObsidianOpen<cr>', desc = 'Open Obsidian' },
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
    { '<leader>tt', '<cmd>tabnew<cr>', desc = 'Tabs: New Tab' },
    { '<leader>ta', '<cmd>tabprevious<cr>', desc = 'Tabs: Previous' },
    { '<leader>td', '<cmd>tabnext<cr>', desc = 'Tabs: Next' },
    { '<leader>tc', '<cmd>tabclose<cr>', desc = 'Tabs: Close' },
    { '<leader>tC', '<cmd>tabonly<cr>', desc = 'Tabs: Close other Tabs' },
    { '<leader>tf', '<cmd>FzfLua tabs<cr>', desc = 'Tabs: Find' },
    { '<leader>fv', '<cmd>FzfLua tabs<cr>', desc = 'Find Tabs' },
    { '<leader>t1', '<cmd>tabn 1<cr>', desc = 'Tabs: 1' },
    { '<leader>t2', '<cmd>tabn 2<cr>', desc = 'Tabs: 2' },
    { '<leader>t3', '<cmd>tabn 3<cr>', desc = 'Tabs: 3' },
    { '<leader>t4', '<cmd>tabn 4<cr>', desc = 'Tabs: 4' },
    { '<leader>t5', '<cmd>tabn 5<cr>', desc = 'Tabs: 5' },
    { '<leader>t6', '<cmd>tabn 6<cr>', desc = 'Tabs: 6' },
    { '<leader>t7', '<cmd>tabn 7<cr>', desc = 'Tabs: 7' },
    { '<leader>t8', '<cmd>tabn 8<cr>', desc = 'Tabs: 8' },
    { '<leader>t9', '<cmd>tabn 9<cr>', desc = 'Tabs: 9' },
    { '<leader>t0', '<cmd>tabn 10<cr>', desc = 'Tabs: 10' },

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
    { '<leader>cq', '<cmd>vsplit<cr>', desc = 'Split Vertical' },
    { '<leader>ce', '<cmd>split<cr>', desc = 'Split Horizontal' },
    { '<leader>cC', '<cmd>only<cr>', desc = 'Close all Others' },
    { '<leader>cc', '<cmd>close<cr>', desc = 'Close Window' },
    { '<leader>ca', '<cmd>wincmd H<cr>', desc = 'Swap Left' },
    { '<leader>cd', '<cmd>wincmd L<cr>', desc = 'Swap Right' },
    { '<leader>cw', '<cmd>wincmd K<cr>', desc = 'Swap Up' },
    { '<leader>cs', '<cmd>wincmd J<cr>', desc = 'Swap Down' },
    { '<leader>cm', '<cmd>MaximizerToggle<cr>', desc = 'Maximizer' },
    {
      '<leader>c1',
      function()
        vim.cmd('vertical resize ' .. math.floor(vim.o.columns / 3))
      end,
      desc = 'Resize Left 1/3',
    },
    {
      '<leader>c2',
      function()
        vim.cmd('vertical resize ' .. math.floor(vim.o.columns * 2 / 3))
      end,
      desc = 'Resize Right 2/3',
    },
    {
      '<leader>c3',
      function()
        vim.cmd('resize ' .. math.floor(vim.o.lines / 3))
      end,
      desc = 'Resize Up 1/3',
    },
    {
      '<leader>c4',
      function()
        vim.cmd('resize ' .. math.floor(vim.o.lines * 2 / 3))
      end,
      desc = 'Resize Down 2/3',
    },
    { '<leader>cr', '<cmd>resize | vertical resize | wincmd =<cr>', desc = 'Reset Window Sizes' },

    --Delete and Create Files
    {
      '<leader>xa',
      function()
        local new_file_path = vim.fn.input('New file path: ', vim.fn.expand '%:p:h' .. '/', 'file')
        if new_file_path ~= '' then
          vim.fn.execute('edit ' .. new_file_path)
        end
      end,
      desc = 'Create New File',
    },

    {
      '<leader>xd',
      function()
        local file_name = vim.api.nvim_buf_get_name(0)
        if vim.fn.confirm('Are you sure you want to delete this file?', '&Yes\n&No', 2) == 1 then
          vim.fn.delete(file_name)
          vim.api.nvim_command 'bdelete!'
        end
      end,
      desc = 'Delete File',
    },
  },
}
