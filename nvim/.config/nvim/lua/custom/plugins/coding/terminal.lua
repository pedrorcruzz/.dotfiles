return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 16,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = false,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      -- Mapeamentos para diferentes direções
      local Terminal = require('toggleterm.terminal').Terminal
      local function create_terminal(direction, size, keymap)
        local term = Terminal:new { direction = direction, size = size }
        vim.keymap.set({ 'n', 't' }, keymap, function()
          term:toggle()
        end, { desc = 'Toggle Terminal (' .. direction .. ')' })
      end

      create_terminal('horizontal', 20, '<S-x>')
      -- create_terminal("vertical", 60, "<C-]>")
      create_terminal('float', nil, '<S-z>')

      -- Atalho para LazyGit
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
    end,
  },
}
