return {
  'b0o/incline.nvim',
  dependencies = {
    { 'SmiteshP/nvim-navic', setup = { highlight = true } },
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  config = function()
    local helpers = require 'incline.helpers'
    local navic = require 'nvim-navic'
    local devicons = require 'nvim-web-devicons'
    local harpoon = require 'harpoon'

    require('incline').setup {
      hide = { cursorline = false },
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
        placement = { vertical = 'top', horizontal = 'right' },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end

        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified and ' ●' or ''
        local res = {
          -- ft_icon and { '', guifg = ft_color } or '', --ft_color
          -- ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
          ft_icon and { ' ', ft_icon, ' ', guibg = nil, guifg = ft_color } or '',
          -- ft_icon and { '', guifg = '#202020' } or '',
          ' ', --sempre 1
          { filename .. modified, gui = 'bold' },
          ' ', -- nao tem nada
          ' ',
          -- guibg = '#1A1A1A',
          -- guifg = '#abb2bf',
        }
        -- if props.focused then
        --   for _, item in ipairs(navic.get_data(props.buf) or {}) do
        --     table.insert(res, {
        --       { ' > ', group = 'NavicSeparator' },
        --       { item.icon, group = 'NavicIcons' .. item.type },
        --       { item.name, group = 'NavicText' },
        --     })
        --   end
        -- end

        local function get_harpoon_items()
          local marks = harpoon:list().items
          local current_file_path = vim.fn.expand '%:p:. '
          local label = {}

          for id, item in ipairs(marks) do
            if item.value == current_file_path then
              table.insert(label, { id .. ' ', guifg = '#FFFFFF', gui = 'bold' })
            else
              table.insert(label, { id .. ' ', guifg = '#434852' })
            end
          end

          if #label > 0 then
            table.insert(label, 1, { '󰛢 ', guifg = '#CA8BFF' })
          end
          return label
        end
        local harpoon_items = get_harpoon_items()
        for _, item in ipairs(harpoon_items) do
          table.insert(res, item)
        end

        -- if ft_icon then
        --   table.insert(res, ' ')
        --   -- table.insert(res, { '', guifg = '#1A1A1A' })
        --   table.insert(res, { ' ', ' ', guibg = '#1A1A1A', guifg = helpers.contrast_color '#1A1A1A' })
        --   table.insert(res, { '', guifg = '#1A1A1A' })
        -- end

        return res
      end,
    }
  end,
}
