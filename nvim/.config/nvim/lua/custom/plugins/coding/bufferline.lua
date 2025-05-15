local bufferline_active = false

return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'echasnovski/mini.bufremove',
  },
  lazy = true,
  event = 'VeryLazy',
  opts = {
    options = {
      show_bufferline = bufferline_active,
      close_command = function(bufnum)
        require('mini.bufremove').delete(bufnum, false)
      end,
      right_mouse_command = function(bufnum)
        require('mini.bufremove').delete(bufnum, false)
      end,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(_, _, diagnostics)
        local symbols = {
          error = '',
          warning = '',
          info = '',
          hint = '',
        }
        local result = {}
        for name, count in pairs(diagnostics) do
          local sym = symbols[name]
          if sym and count > 0 then
            table.insert(result, sym .. count)
          end
        end
        return ' ' .. table.concat(result, ' ')
      end,
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    vim.opt.showtabline = bufferline_active and 2 or 0
  end,
  keys = {
    {
      '<leader>lb',
      function()
        local loaded = package.loaded['bufferline']
        if not loaded then
          require('lazy').load { plugins = { 'bufferline.nvim' } }
        end

        bufferline_active = not bufferline_active

        require('bufferline').setup {
          options = {
            show_bufferline = bufferline_active,
          },
        }
        vim.opt.showtabline = bufferline_active and 2 or 0
      end,
      desc = 'Bufferline: Toggle',
    },
  },
}
