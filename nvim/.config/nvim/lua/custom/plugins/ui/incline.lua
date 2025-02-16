return {
  {
    'b0o/incline.nvim',
    config = function()
      local helpers = require 'incline.helpers'
      local devicons = require 'nvim-web-devicons'

      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 1 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified and ' ●' or ''
          return {
            ft_icon and { '', guifg = ft_color } or '',
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename .. modified, gui = 'bold' },
            ' ',
            -- guibg = '#1A1A1A',
            -- guifg = '#abb2bf',
          }
        end,
      }

      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          require('incline').enable()
        end,
      })
    end,
    event = 'VeryLazy',
  },
}
