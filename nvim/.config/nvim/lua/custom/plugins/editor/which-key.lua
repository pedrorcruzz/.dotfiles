return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  lazy = true,
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      preset = 'modern', --classic, modern, helix
      win = {
        border = 'shadow', -- none, single, double, shadow
        -- width = 60,
      },
    }

    -- Document existing key chains
    require('which-key').add {
      { '<leader>', group = ' 󰠥 ROSAVIM' }, --󰧵
      { '<leader>e', group = 'File Explorer', icon = '' },
      -- { "<leader>'", group = 'Wrap', icon = '󰭷' },
      { '<leader>ft', group = 'Todo Comments', icon = ' ' },
      { '<leader>z', group = 'Dropbar', icon = '󰳯' },
      { '<leader>,', group = 'Trouble Diagnostic', icon = '󰁨' },
      { '<leader>j', group = 'Windows', icon = '' },
      { '<leader>v', group = 'DBUI', icon = '' },
      { '<leader>b', group = 'BufferLine', icon = '' },
      { '<leader>x', group = 'Explorer Tools', icon = '' },

      { '<leader>n', group = 'Neotest', icon = '󰙨' },
      { '<leader>ng', group = 'Go Test', icon = '' },

      { '<leader>y', group = 'Yazi', icon = '' },
      { '<leader>;', group = 'Home', icon = '' },
      { '<leader>w', group = 'Save', icon = '' },
      { '<leader>W', group = 'Save Without Formatter', icon = '' },
      { '<leader>[', group = 'Previous', icon = '󰙣' },
      { '<leader>h', group = 'No Highlight', icon = '󰸱' },
      { '<leader>]', group = 'Next', icon = '󰙡' },
      { '<leader>a', group = 'Avante', icon = ' ' },
      { '<leader>ci', group = 'ToggleTerm', icon = ' ' },
      { '<leader>o', group = 'Grapple', icon = '󱝩' },
      -- { '<leader>o', group = 'Harpoon', icon = '󱝩' },

      { '<leader>j', group = 'Obsidian', icon = '' },
      { '<leader>vb', group = 'Buffers', icon = '' },
      { '<leader>vt', group = 'Tabs', icon = '' },

      { '<leader>L', group = 'Lazy', icon = '󰒲 ' },

      { '<leader>l', group = 'Tools', icon = ' ' },
      { '<leader>lp', group = 'Colemark', icon = '' },
      { '<leader>lx', group = 'Virtual Environment', icon = ' ' },
      { '<leader>le', group = 'GrugFar', icon = '󰛔' },

      { '<leader>p', group = 'Languages Tools', icon = ' ' },
      { '<leader>pp', group = 'PHP Tools', icon = ' ' },
      { '<leader>pg', group = 'GO Tools', icon = ' ' },
      { '<leader>pj', group = 'Javascript Tools', icon = ' ' },
      { '<leader>ps', group = 'Spring Tools', icon = ' ' },

      { '<leader>pjc', group = 'Codi', icon = ' ' },
      { '<leader>pgd', group = 'Debug', icon = ' ' },
      { '<leader>pgt', group = 'Test', icon = '󰙨 ' },

      { '<leader>pl', group = 'Laravel Tools', icon = ' ' },
      { '<leader>plc', group = 'Composer', icon = ' ' },
      { '<leader>pln', group = 'Sail', icon = ' ' },
      { '<leader>pld', group = 'Diagrams', icon = ' ' },
      { '<leader>plx', group = 'Cache', icon = '󰃨 ' },
      { '<leader>plh', group = 'IDE Helper', icon = ' ' },

      { '<leader>c', group = 'Window', icon = '󰶛' },
      { '<leader>t', group = 'Tabs', icon = '󱦞' },

      { '<leader>i', group = 'Copilot', icon = '' },
      { '<leader>u', group = 'Markdown', icon = '' },
      { '<leader>d', group = 'Debug' },
      { '<leader>f', group = 'Find' },
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
    { '<leader>h', '<cmd>nohlsearch<cr>', desc = 'No Highlight' },
    { '<leader>q', '<cmd>confirm q<cr>', desc = 'Exit' },
    { '<leader>lt', '<cmd>TSContextToggle<cr>', desc = 'TSCOntext: Toggle' },
    { '<leader>fp', '<cmd>NeovimProjectDiscover<cr>', desc = 'Discover Projects' },

    --Lazy
    { '<leader>Ll', '<cmd>Lazy<cr>', desc = 'Lazy' },
    { '<leader>Lp', '<cmd>Lazy profile<cr>', desc = 'Profile' },
    { '<leader>Lh', '<cmd>LazyHealth<cr>', desc = 'Health' },
    { '<leader>LH', '<cmd>Lazy help<cr>', desc = 'Help' },
    { '<leader>Lb', '<cmd>Lazy build<cr>', desc = 'Build' },
    { '<leader>Lc', '<cmd>Lazy clean<cr>', desc = 'Clean' },
    { '<leader>LC', '<cmd>Lazy clear<cr>', desc = 'Clear' },
    { '<leader>Lu', '<cmd>Lazy update<cr>', desc = 'Update' },
    { '<leader>Ls', '<cmd>Lazy sync<cr>', desc = 'Sync' },

    --Wrap
    -- { "<leader>'", '<cmd>:set wrap<cr>', desc = 'Wrap' },

    --Bufers
    { '<leader>[', '<cmd>bprevious<cr>', desc = 'Previous' },
    { '<leader>]', '<cmd>bnext<cr>', desc = 'Next' },

    --Tabs
    { '<leader>tt', '<cmd>tabnew<cr>', desc = 'Tabs: New Tab' },
    { '<leader>tj', '<cmd>tabprevious<cr>', desc = 'Tabs: Previous' },
    { '<leader>tk', '<cmd>tabnext<cr>', desc = 'Tabs: Next' },
    { '<leader>tc', '<cmd>tabclose<cr>', desc = 'Tabs: Close' },
    { '<leader>tC', '<cmd>tabonly<cr>', desc = 'Tabs: Close other Tabs' },
    { '<leader>tf', '<cmd>Telescope telescope-tabs list_tabs<cr>', desc = 'Tabs: Find' },
    { '<leader>fv', '<cmd>Telescope telescope-tabs list_tabs<>', desc = 'Find Tabs' },
    { '<leader>t1', '<cmd>tabn 1<cr>', desc = 'Tabs: 1' },
    { '<leader>t2', '<cmd>tabn 2<cr>', desc = 'Tabs: 2' },
    { '<leader>t3', '<cmd>tabn 3<cr>', desc = 'Tabs: 3' },
    { '<leader>t4', '<cmd>tabn 4<cr>', desc = 'Tabs: 4' },
    { '<leader>t5', '<cmd>tabn 5<cr>', desc = 'Tabs: 5' },
    { '<leader>t6', '<cmd>tabn 6<cr>', desc = 'Tabs: 6' },
    { '<leader>t7', '<cmd>tabn 7<cr>', desc = 'Tabs: 7' },
    { '<leader>t8', '<cmd>tabn 8ba<cr>', desc = 'Tabs: 8' },
    { '<leader>t9', '<cmd>tabn 9<cr>', desc = 'Tabs: 9' },
    { '<leader>t0', '<cmd>tabn 10<cr>', desc = 'Tabs: 10' },

    --Git
    -- { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = 'Git: Commits' },
    { '<leader>gt', '<cmd>Gitsigns toggle_current_line_blame<CR>', desc = 'Git: Toggle Current Line Blame' },
    -- { '<leader>gb', '<cmd>FzfLua git_branches<CR>', desc = 'Git: Branches' },
    -- { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Git: Status' },
    -- { '<leader>gl', '<cmd>FzfLua git_blame<CR>', desc = 'Git: Blame' },
    -- { '<leader>gt', '<cmd>FzfLua git_stash<CR>', desc = 'Git: Stash' },

    --Window
    { '<leader>1', '<cmd>wincmd h<cr>', desc = 'Focus Left' },
    { '<leader>2', '<cmd>wincmd l<cr>', desc = 'Focus Right' },
    { '<leader>3', '<cmd>wincmd j<cr>', desc = 'Focus Down' },
    { '<leader>4', '<cmd>wincmd k<cr>', desc = 'Focus Up' },
    { '<leader>cq', '<cmd>vsplit<cr>', desc = 'Split Vertical' },
    { '<leader>ce', '<cmd>split<cr>', desc = 'Split Horizontal' },
    { '<leader>cC', '<cmd>only<cr>', desc = 'Close all Others' },
    { '<leader>cc', '<cmd>close<cr>', desc = 'Close Window' },
    { '<leader>ch', '<cmd>wincmd H<cr>', desc = 'Swap Left' },
    { '<leader>cl', '<cmd>wincmd L<cr>', desc = 'Swap Right' },
    { '<leader>ck', '<cmd>wincmd K<cr>', desc = 'Swap Up' },
    { '<leader>cj', '<cmd>wincmd J<cr>', desc = 'Swap Down' },
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
