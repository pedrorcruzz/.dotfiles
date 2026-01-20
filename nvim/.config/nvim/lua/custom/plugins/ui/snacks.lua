return {
  'folke/snacks.nvim',
  -- branch = 'main',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = ' ', key = 'p', desc = 'Projects', action = ':NeovimProjectDiscover' },
          -- { icon = ' ', key = 'o', desc = 'Obsidian', action = ':e ~/Developer/second-brain/Segundo\\ Cérebro.md' },
          {
            icon = ' ',
            key = 'o',
            desc = 'Obsidian',
            action = function()
              Snacks.picker.smart { cwd = vim.fn.expand '~/Developer/second-brain/' }
            end,
          },
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = '', key = 'n', desc = 'New file', action = ':enew' },
          { icon = ' ', key = 'd', desc = 'Database UI', action = ':DBUIToggle' },
          { icon = ' ', key = 'w', desc = 'Yazi', action = ':Yazi cwd' },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          -- {
          --   icon = ' ',
          --   key = 's',
          --   desc = 'Restore Session',
          --   action = function()
          --     require('persistence').load()
          --   end,
          -- },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'x', desc = 'Colorscheme', action = ':e ~/.config/nvim/lua/custom/plugins/ui/colorscheme.lua' },
          {
            icon = ' ',
            key = 'b',
            desc = 'Browse Repo',
            action = function()
              Snacks.gitbrowse()
            end,
          },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        header = {
          [[
    ██████╗  ██████╗ ███████╗ █████╗ ██╗   ██╗██╗███╗   ███╗
    ██╔══██╗██╔═══██╗██╔════╝██╔══██╗██║   ██║██║████╗ ████║
    ██████╔╝██║   ██║███████╗███████║██║   ██║██║██╔████╔██║
    ██╔══██╗██║   ██║╚════██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║  ██║╚██████╔╝███████║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        },
      },
      sections = {
        -- Wide version (180 columns or more)
        {
          enabled = function()
            return (vim.o.columns >= 180)
          end,
          {
            -- section = 'terminal',
            section = 'header',
            -- cmd = 'chafa -f symbols -c full --speed=0.8 --clear --stretch $HOME/.config/nvim/lua/custom/plugins/ui/dashboard_img/gopher.gif; sleep .1',
            indent = 64, --64 if use section terminal
            -- height = 12, --16
            -- width = 28, --35

            enabled = function()
              return not (vim.o.columns < 135)
            end,
          },
          {
            section = 'startup',
            indent = 64,
          },
          {
            pane = 1,
            {
              padding = 0, --1 if use section terminal
            },

            { icon = ' ', key = 'p', desc = 'Projects', action = ':NeovimProjectDiscover' },
            -- { icon = ' ', key = 'o', desc = 'Obsidian', action = ':e ~/Developer/second-brain/Segundo\\ Cérebro.md' },
            {
              icon = ' ',
              key = 'o',
              desc = 'Obsidian',
              action = function()
                Snacks.picker.smart { cwd = vim.fn.expand '~/Developer/second-brain/' }
              end,
            },
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = '', key = 'n', desc = 'New file', action = ':enew' },
            { icon = ' ', key = 'd', desc = 'Database UI', action = ':DBUIToggle' },
            { icon = ' ', key = 'w', desc = 'Yazi', action = ':Yazi cwd' },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            -- {
            --   icon = ' ',
            --   key = 's',
            --   desc = 'Restore Session',
            --   action = function()
            --     require('persistence').load()
            --   end,
            -- },
            { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'x', desc = 'Colorscheme', action = ':e ~/.config/nvim/lua/custom/plugins/ui/colorscheme.lua' },
            {
              icon = ' ',
              key = 'b',
              desc = 'Browse Repo',
              action = function()
                Snacks.gitbrowse()
              end,
            },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
          {
            pane = 2,
            {
              padding = 10, --14 if use section terminal
            },
            {
              icon = ' ',
              title = 'Recent Files',
              section = 'recent_files',
              indent = 3,
              padding = 1,
              limit = 7,
            },
            {
              icon = ' ',
              title = 'Projects',
              section = 'projects',
              limit = 4,
              indent = 3,
            },
          },
          {
            padding = 2,
          },
          {
            section = 'terminal',
            cmd = 'chafa -f symbols -c full --speed=0.8 --clear --stretch $HOME/.config/nvim/lua/custom/plugins/ui/dashboard_img/gopher.gif; sleep .1',
            height = 8, --16
            width = 20, --35
            indent = 50,
          },
        },

        -- Slim version (less than 180 columns)
        {
          enabled = function()
            return (vim.o.columns < 180)
          end,
          {
            { section = 'header' },
            {
              section = 'startup',
              padding = 1,
            },
            { icon = ' ', key = 'p', desc = 'Projects', action = ':NeovimProjectDiscover' },
            -- { icon = ' ', key = 'o', desc = 'Obsidian', action = ':e ~/Developer/second-brain/Segundo\\ Cérebro.md' },
            {
              icon = ' ',
              key = 'o',
              desc = 'Obsidian',
              action = function()
                Snacks.picker.smart { cwd = vim.fn.expand '~/Developer/second-brain/' }
              end,
            },
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = '', key = 'n', desc = 'New file', action = ':enew' },
            { icon = ' ', key = 'd', desc = 'Database UI', action = ':DBUIToggle' },
            { icon = ' ', key = 'w', desc = 'Yazi', action = ':Yazi cwd' },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            -- {
            --   icon = ' ',
            --   key = 's',
            --   desc = 'Restore Session',
            --   action = function()
            --     require('persistence').load()
            --   end,
            -- },
            { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'x', desc = 'Colorscheme', action = ':e ~/.config/nvim/lua/custom/plugins/ui/colorscheme.lua' },
            {
              icon = ' ',
              key = 'b',
              desc = 'Browse Repo',
              action = function()
                Snacks.gitbrowse()
              end,
            },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
            {
              padding = 1,
            },
            {
              icon = ' ',
              title = 'Recent Files',
              section = 'recent_files',
              padding = 1,
            },
            {
              icon = ' ',
              title = 'Projects',
              section = 'projects',
              padding = 3,
            },
          },
        },
      },
    },
    explorer = {
      enabled = true,
      cycle = false,
      replace_netrw = false,
    },
    indent = {
      enabled = false,
      char = '│',
      only_scope = false, -- only show indent guides of the scope
      only_current = false, -- only show indent guides in the current window
      animate = {
        enabled = false,
        style = 'out',
        easing = 'linear',
        duration = {
          step = 20, -- duração de cada passo em ms
          total = 500, -- duração máxima
        },
      },
      -- scope = {
      --   enabled = true, -- Habilitar destaque do escopo atual
      width = 70,
      --   priority = 200,
      --   char = '│',
      --   underline = true, -- Sublinhado no início do escopo
      -- },
      filter = function(buf)
        return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == '' and vim.fn.line '$' > 1
      end,
    },
    profiler = {
      enabled = true,
    },
    input = {
      enabled = true,
      win = {
        row = 0.35,
        col = 0.35,
        border = 'rounded', --rounded, shadow, single, double, solid, none
        width = 65,
        height = 2,
      },
    },
    terminal = {
      enabled = false,
    },
    edgy = {
      enabled = true,
    },
    picker = {
      enabled = true,
      hidden = false,
      ignored = true,
      layout = { preset = 'default', preview = true, border = 'rounded' }, -- default, vscode, telescope, dropdown, ivy, ivy_split, vertical, select, horizontal, sidebar
      sources = {
        files = {
          hidden = false,
          ignored = false,
        },
        explorer = {
          finder = 'explorer',
          diagnostics = true,
          diagnostics_open = false,
          layout = { layout = { position = 'left', width = 34 }, preview = false },
          focus = 'list',
          auto_close = false,
          git_untracked = true,
          git_status_open = false,
        },
      },
      styles = {
        enabled = true,
      },
      win = {
        input = {
          keys = {
            ['<C-h>'] = { 'toggle_hidden', mode = { 'i', 'n' } },
            ['<C-l>'] = { 'toggle_ignored', mode = { 'i', 'n' } },
          },
        },
        list = {
          keys = {
            ['<C-h>'] = { 'toggle_hidden', mode = { 'i', 'n' } },
            ['<C-l>'] = { 'toggle_ignored', mode = { 'i', 'n' } },
          },
        },
      },
      icons = {
        files = {
          enabled = true,
          dir = ' ', --   
          dir_open = ' ', --
          file = ' ',
          test_dir = ' ',
        },
        -- git = {
        --   enabled = true,
        --   commit = '󰜘 ',
        --   staged = '●',
        --   added = '',
        --   deleted = '',
        --   ignored = ' ',
        --   modified = '○',
        --   renamed = '',
        --   unmerged = ' ',
        --   untracked = '?',
        -- },
        diagnostics = {
          Error = ' ',
          Warn = ' ',
          Hint = ' ',
          Info = ' ',
        },
        lsp = {
          unavailable = '',
          enabled = ' ',
          disabled = ' ',
          attached = '󰖩 ',
        },
        kinds = {
          Array = ' ',
          Boolean = '󰨙 ',
          Class = ' ',
          Color = ' ',
          Control = ' ',
          Collapsed = ' ',
          Constant = '󰏿 ',
          Constructor = ' ',
          Copilot = ' ',
          Enum = ' ',
          EnumMember = ' ',
          Event = ' ',
          Field = ' ',
          File = ' ',
          Folder = ' ',
          Function = '󰊕 ',
          Interface = ' ',
          Key = ' ',
          Keyword = ' ',
          Method = '󰊕 ',
          Module = ' ',
          Namespace = '󰦮 ',
          Null = ' ',
          Number = '󰎠 ',
          Object = ' ',
          Operator = ' ',
          Package = ' ',
          Property = ' ',
          Reference = ' ',
          Snippet = '󱄽 ',
          String = ' ',
          Struct = '󰆼 ',
          Text = ' ',
          TypeParameter = ' ',
          Unit = ' ',
          Unknown = ' ',
          Value = ' ',
          Variable = '󰀫 ',
        },
      },
    },

    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    image = { enabled = false },
    icons = { enabled = true },
    animate = { enabled = true },
    words = { enabled = true },
    scroll = {
      enabled = false,
      animate = {
        duration = { step = 12, total = 100 }, --step 20 | total 120  | step 15 | total 105
      },
    },
    rename = { enabled = true },
    toggle = { enabled = true },
    lazygit = { enabled = true },
    git = {

      enabled = true,
      width = 0.6,
      height = 0.6,
      border = 'rounded',
      title = ' Git Blame ',
      title_pos = 'center',
      ft = 'git',
    },
    notifier = {
      enabled = true,
      timeout = 3000,
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 1, right = 1, bottom = 1 },
      padding = true,
      sort = { 'level', 'added' },
      level = vim.log.levels.TRACE,
      style = 'compact', --compact, fancy, minimal
      top_down = true,
      date_format = '%R',
      more_format = ' ↓ %d lines ',
      refresh = 50,
    },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      '<leader>fs',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader><cr>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader><space>',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>sb',
      function()
        -- Snacks.picker.lines()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep Buffers',
    },
    -- { '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep', },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>N',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
    -- find

    -- { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers', },
    {
      '<leader>fc',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Config File',
    },
    {
      '<leader>ftt',
      function()
        Snacks.picker.todo_comments()
      end,
      desc = 'Todo Comments',
    },
    {
      '<leader>ftf',
      function()
        Snacks.picker.todo_comments { keywords = { 'FIX', 'FIXME' } }
      end,
      desc = 'Find Fix/Fixme',
    },
    {
      '<leader>fte',
      function()
        Snacks.picker.todo_comments { keywords = { 'TODO' } }
      end,
      desc = 'Find Todo',
    },
    {
      '<leader>ftn',
      function()
        Snacks.picker.todo_comments { keywords = { 'NOTE' } }
      end,
      desc = 'Find Note',
    },
    {
      '<leader>fti',
      function()
        Snacks.picker.todo_comments { keywords = { 'INFO' } }
      end,
      desc = 'Find Info',
    },
    {
      '<leader>fth',
      function()
        Snacks.picker.todo_comments { keywords = { 'HACK' } }
      end,
      desc = 'Find Hack',
    },
    {
      '<leader>ftw',
      function()
        Snacks.picker.todo_comments { keywords = { 'WARN' } }
      end,
      desc = 'Find Warn',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Find Buffers',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.git_files()
      end,
      desc = 'Find Git Files',
    },
    -- { '<leader>f', function() Snacks.picker.projects() end, desc = 'Projects', },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = 'Recent',
    },

    -- git
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>gl',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gc',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Git Log',
    },
    {
      '<leader>gL',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = 'Git Log Line',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Git Status',
    },
    {
      '<leader>gS',
      function()
        Snacks.picker.git_stash()
      end,
      desc = 'Git Stash',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.git_diff()
      end,
      desc = 'Git Diff (Hunks)',
    },

    {
      '<leader>gf',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = 'Git Log File',
    },
    -- Grep
    {
      '<leader>sb',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Search Buffers',
    },
    {
      '<leader>sb',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep Open Buffers',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    -- search
    -- { '<leader>s"', function() Snacks.picker.registers() end, desc = 'Registers', },
    {
      '<leader>s/',
      function()
        Snacks.picker.search_history()
      end,
      desc = 'Search History',
    },
    {
      '<leader>sa',
      function()
        Snacks.picker.autocmds()
      end,
      desc = 'Autocmds',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Buffer Lines',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>sC',
      function()
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>sD',
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = 'Buffer Diagnostics',
    },
    {
      '<leader>sH',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.highlights()
      end,
      desc = 'Highlights',
    },
    {
      '<leader>si',
      function()
        Snacks.picker.icons()
      end,
      desc = 'Icons',
    },
    {
      '<leader>sj',
      function()
        Snacks.picker.jumps()
      end,
      desc = 'Jumps',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Keymaps',
    },
    {
      '<leader>sl',
      function()
        Snacks.picker.loclist()
      end,
      desc = 'Location List',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
    {
      '<leader>sM',
      function()
        Snacks.picker.man()
      end,
      desc = 'Man Pages',
    },
    {
      '<leader>sp',
      function()
        Snacks.picker.lazy()
      end,
      desc = 'Search for Plugin Spec',
    },
    {
      '<leader>sR',
      function()
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix List',
    },
    -- {
    --   '<leader>sR',
    --   function()
    --     Snacks.picker.resume()
    --   end,
    --   desc = 'Resume',
    -- },
    {
      '<leader>sq',
      function()
        Snacks.picker.registers()
      end,
      desc = 'Search Registers',
    },

    {
      '<leader>su',
      function()
        Snacks.picker.undo()
      end,
      desc = 'Undo History',
    },
    {
      '<leader>sx',
      function()
        Snacks.picker.colorschemes()
      end,
      desc = 'Colorschemes',
    },

    -- LSP
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = 'Goto Declaration',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto T[y]pe Definition',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>sS',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = 'LSP Workspace Symbols',
    },

    {
      '<leader>gg',
      function()
        Snacks.lazygit.open()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>;',
      function()
        Snacks.dashboard()
      end,
      desc = 'Dashboard',
    },
    {
      '<leader>.',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dimiss Notification',
    },
    {
      '<leader>lv',
      function()
        Snacks.rename.rename_file()
      end,
      desc = 'Snacks: Rename Current File',
    },
    {
      '<leader>lm',
      function()
        Snacks.image.hover()
      end,
      desc = 'Snacks: Image Preview',
    },
    -- {
    --   '<S-test>',
    --   function()
    --     Snacks.terminal.toggle()
    --   end,
    --   desc = 'Snacks: Terminal Toggle',
    -- },
    --
    -- {
    --   '<leader>lT>',
    --   function()
    --     Snacks.terminal.open(nil, { win = { position = 'right' } })
    --   end,
    --   desc = 'Snacks: Terminal Split',
    -- },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        -- Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>lw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>lg'
        -- Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.line_number():map '<leader>ln'
        Snacks.toggle.zen():map '<leader>lz'
        -- Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        -- Snacks.toggle.treesitter():map '<leader>lg'
        -- Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        -- Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>li'
        -- Snacks.toggle.profiler():map '<leader>lk'
        -- Snacks.toggle.profiler_highlights():map '<leader>lj'
        Snacks.toggle.dim():map '<leader>lk'
      end,
    })
  end,
}
