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
          { icon = ' ', key = 'p', desc = 'Projects', action = ':NeovimProjectDiscover' },
          { icon = ' ', key = 'o', desc = 'Obsidian', action = ':e ~/Workspace/second-brain/Segundo\\ Cérebro.md' },
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'n', desc = 'New file', action = ':enew' },
          { icon = ' ', key = 'w', desc = 'Worktree', action = ':Yazi cwd' },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'x', desc = 'Colorscheme', action = ':e ~/.config/nvim/lua/custom/plugins/ui/colorscheme.lua' },
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
      width = 80,
      sections = {
        {
          pane = 1,
          -- section = 'header',
          padding = 5,
          enabled = function()
            return not (vim.o.columns < 135)
          end,
        },
        {
          pane = 1,
          section = 'terminal',

          -- cmd = 'ascii-image-converter --color -c -H23   "$HOME/.config/nvim/lua/custom/plugins/ui/dashboard_img/luffy-haha.png"', -- -c

          -- cmd = 'chafa ~/.config/nvim/lua/custom/plugins/ui/dashboard_img/zoro.jpg --format symbols --size 54x55 --align center; sleep .1',

          -- cmd = 'img2art ~/.config/nvim/lua/custom/plugins/ui/dashboard_img/luffy-haha.png --threshold 50 --scale .10 --quant 16 --with-color', -- --no-with-color --scale 24

          -- gif
          cmd = 'chafa -f symbols --symbols sextant -c full --speed=0.8 --clear --stretch "$HOME/.config/nvim/lua/custom/plugins/ui/dashboard_img/golang.gif"; sleep .1',
          height = 15,
          width = 35,
          indent = 18,

          --normal(png,jpg)
          -- width = 65, --65
          -- height = 26, --26
          -- indent = 10,
          -- padding = 2,
          enabled = function()
            return not (vim.o.columns < 135)
          end,
        },

        --Narrow screen
        {
          pane = 1,
          section = 'terminal',

          -- cmd = 'chafa ~/.config/nvim/lua/custom/plugins/ui/dashboard_img/anime-girl-mask-nobg.png --format symbols --size 54x55 --align center; sleep .1',

          -- cmd = 'ascii-image-converter --color -H23    "$HOME/.config/nvim/lua/custom/plugins/ui/dashboard_img/zoro.jpg"', -- -c

          -- cmd = 'img2art ~/.config/nvim/lua/custom/plugins/ui/dashboard_img/hq.png --threshold 50 --scale .17 --quant 16 --with-color',

          --gif
          cmd = 'chafa -f symbols --symbols sextant -c full --speed=0.8 --clear --stretch "$HOME/.config/nvim/lua/custom/plugins/ui/dashboard_img/golang.gif"; sleep .1',
          height = 13,
          width = 32,
          indent = 22,

          --normal(png,jpg)
          -- height = 16, --25
          -- width = 56,
          -- padding = 2,
          -- indent = 18,
          enabled = function()
            return not (vim.o.columns > 135)
          end,
        },
        -- Right Rosavim
        {
          pane = 2,
          -- section = 'header',
          gap = 0,
          padding = 1, --1
          enabled = function()
            return not (vim.o.columns < 135)
          end,
        },
        -- Narrow screen
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = 'Git Graph',
              icon = ' ',
              cmd = [[fish -c 'git log --graph --oneline --decorate --all --color=always -n 15']],
              indent = 1,
              -- height = 35,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend('force', {
              pane = 1,
              section = 'terminal',
              enabled = function()
                return in_git and vim.o.columns > 130
              end,
              padding = 1,
            }, cmd)
          end, cmds)
        end,
        {
          pane = 2,
          section = 'startup',
          padding = 2,
          enabled = function()
            return not (vim.o.columns > 135)
          end,
        },
        {
          pane = 2,
          section = 'startup',
          padding = 2,
          enabled = function()
            return not (vim.o.columns < 135)
          end,
        },
        {
          pane = 2,
          icon = ' ',
          section = 'keys',
          indent = 1,
          gap = 0,
          padding = 2,
        },
        {
          pane = 2,
          icon = '',
          title = 'Recent Files',
          section = 'recent_files',
          enabled = function()
            return not (vim.o.columns < 135)
          end,
          indent = 1,
          limit = 10,
          padding = 2,
        },
        {
          pane = 2,
          limit = 5,
          icon = '',
          title = 'Projects',
          section = 'projects',
          enabled = function()
            return not (vim.o.columns < 135)
          end,
          indent = 1,
          padding = 2,
        },

        -- Narrow screen
        {
          pane = 1,
          icon = '',
          title = 'Recent Files',
          section = 'recent_files',
          enabled = function()
            return not (vim.o.columns > 135)
          end,
          indent = 1,
          limit = 5,
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
        enabled = vim.fn.has 'nvim-0.10' == 1,
        style = 'out',
        easing = 'linear',
        duration = {
          step = 20, -- duração de cada passo em ms
          total = 500, -- duração máxima
        },
      },
      -- scope = {
      --   enabled = true, -- Habilitar destaque do escopo atual
      --   priority = 200,
      --   char = '│',
      --   underline = true, -- Sublinhado no início do escopo
      -- },
      filter = function(buf)
        return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == '' and vim.fn.line '$' > 1
      end,
    },
    input = {
      enabled = false,
    },
    terminal = {
      enabled = true,
    },
    edgy = {
      enabled = true,
    },
    picker = {
      enabled = true,
      hidden = false,
      ignored = false,
      sources = {
        explorer = {
          finder = 'explorer',
          diagnostics = true,
          diagnostics_open = false,
          layout = { layout = { position = 'right', width = 38 }, preview = false }, --explorer side width 40 default
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
        -- input window
        input = {
          keys = {
            ['<c-h>'] = { 'toggle_hidden', mode = { 'i', 'n' } },
            ['<c-i>'] = { 'toggle_ignored', mode = { 'i', 'n' } },
          },
        },

        list = {
          keys = {
            ['<c-h>'] = { 'toggle_hidden', mode = { 'i', 'n' } },
            ['<c-i>'] = { 'toggle_ignored', mode = { 'i', 'n' } },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    image = { enabled = false },
    animate = { enabled = true },
    words = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 105 }, --step 20 | total 120
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
      style = 'compact',
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
      '<leader>n',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
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
      '<leader>ft',
      function()
        Snacks.picker.todo_comments()
      end,
      desc = 'Todo',
    },
    {
      '<leader>fT',
      function()
        Snacks.picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
      end,
      desc = 'Todo/Fix/Fixme',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find Files',
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
      '<leader>sq',
      function()
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix List',
    },
    {
      '<leader>sR',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
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
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>lo'
        -- Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.line_number():map '<leader>ln'
        Snacks.toggle.zen():map '<leader>lz'
        -- Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        -- Snacks.toggle.treesitter():map '<leader>lxt'
        -- Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        -- Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>li'
        -- Snacks.toggle.dim():map '<leader>uD'
      end,
    })
  end,
}
