return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 16,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      terminal_mappings = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = false,
      direction = 'float',
      close_on_exit = true,
      highlights = {
        Normal = { guibg = '#1c1c1c' },
        NormalFloat = { link = 'Normal' },
        FloatBorder = { guifg = '#1a1a1a' },
      },
      winbar = {
        enabled = false,
        name_formatter = function(term)
          return term.name
        end,
      },
      -- responsiveness = {
      --   horizontal_breakpoint = 135,
      -- },
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'NONE',
          background = 'Normal',
        },
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      local Terminal = require('toggleterm.terminal').Terminal
      local function create_terminal(direction, size, keymap)
        local term = Terminal:new { direction = direction, size = size }
        vim.keymap.set({ 'n', 't' }, keymap, function()
          term:toggle()
        end, { desc = 'Toggle Terminal (' .. direction .. ')' })
      end

      create_terminal('horizontal', 20, '<S-x>')
      create_terminal('vertical', 20, '<C-o>')
      create_terminal('float', nil, '<S-z>')

      local lazygit = Terminal:new {
        cmd = 'lazygit',
        hidden = true,
        direction = 'float',
        float_opts = { border = 'none', width = 100000, height = 100000 },
        on_open = function(_)
          vim.cmd 'startinsert!'
        end,
        count = 99,
      }

      vim.keymap.set('n', '<leader>lg', function()
        lazygit:toggle()
      end, { desc = 'ToggleTerm: LazyGit' })
    end,
    keys = {
      { '<leader>ltd', '<cmd>ToggleTerm 3 direction=horizontal<CR>', desc = 'ToggleTerm: Horizontal Split' },
      { '<leader>lta', '<cmd>ToggleTerm 4 direction=vertical<CR>', desc = 'ToggleTerm: Vertical Split' },
      { '<S-x>', '<cmd>ToggleTerm 1 direction=horizontal size=20<CR>', desc = 'ToggleTerm: Horizontal' },
      -- { '<C-o>', '<cmd>ToggleTerm 1 direction=vertical size=20<CR>', desc = 'ToggleTerm: Vertical' },
      { '<S-z>', '<cmd>ToggleTerm 1 direction=float<CR>', desc = 'ToggleTerm: Float' },
    },
  },
}
