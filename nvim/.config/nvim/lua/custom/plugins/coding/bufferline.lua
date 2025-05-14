local enabled = true

local bufferline_active = false

return {
  'akinsho/bufferline.nvim',
  enabled = enabled,
  lazy = true,
  event = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    options = {
      close_command = function(bufnum)
        require('mini.bufremove').delete(bufnum, false)
      end,
      right_mouse_command = function(bufnum)
        require('mini.bufremove').delete(bufnum, false)
      end,
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
  end,
  keys = {
    {
      '<leader>lb',
      function()
        local loaded = package.loaded['bufferline']
        if not loaded then
          require('lazy').load { plugins = { 'bufferline.nvim' } }
        end

        if not bufferline_active then
          vim.opt.showtabline = 2
          vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePickClose<cr>', { desc = 'Delete Buffer' })
          vim.keymap.set('n', '<leader>bf', '<cmd>BufferLinePick<cr>', { desc = 'Pick Buffer' })
          vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close Left' })
          vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close Right' })
          vim.keymap.set('n', '<leader>bC', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close Others' })
          vim.keymap.set('n', '<leader>bd', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
          vim.keymap.set('n', '<leader>ba', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
          vim.keymap.set('n', '<leader>bq', '<cmd>BufferLineSortByDirectory<cr>', { desc = 'Sort Directory' })
          vim.keymap.set('n', '<leader>be', '<cmd>BufferLineSortByExtension<cr>', { desc = 'Sort Extension' })
          vim.keymap.set('n', '<leader>br', '<cmd>BufferLineSortByRelativeDirectory<cr>', { desc = 'Sort Relative Directory' })
          bufferline_active = true
        else
          vim.opt.showtabline = 0
          vim.keymap.del('n', '<leader>bp')
          vim.keymap.del('n', '<leader>bf')
          vim.keymap.del('n', '<leader>bh')
          vim.keymap.del('n', '<leader>bj')
          vim.keymap.del('n', '<leader>bC')
          vim.keymap.del('n', '<leader>bd')
          vim.keymap.del('n', '<leader>bq')
          vim.keymap.del('n', '<leader>be')
          vim.keymap.del('n', '<leader>br')
          bufferline_active = false
        end
      end,
      desc = 'Bufferline: Toggle',
    },
  },
}
