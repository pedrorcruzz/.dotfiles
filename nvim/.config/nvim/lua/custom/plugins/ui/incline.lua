local incline_active = false

return {
  'b0o/incline.nvim',
  dependencies = {
    { 'SmiteshP/nvim-navic', setup = { highlight = true } },
    'nvim-tree/nvim-web-devicons',
    'cbochs/grapple.nvim',
  },
  event = 'VeryLazy',
  config = function()
    local helpers = require 'incline.helpers'
    local navic = require 'nvim-navic'
    local devicons = require 'nvim-web-devicons'
    local grapple = require 'grapple'
    -- local harpoon = require 'harpoon'

    require('incline').setup {
      hide = { cursorline = false },
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
        placement = { vertical = 'bottom', horizontal = 'center' }, --bottom, center, right, left, top
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end

        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified and ' ●' or ''
        local res = {
          ft_icon and { ' ', ft_icon, ' ', guibg = nil, guifg = ft_color } or '',
          ' ',
          { filename .. modified, gui = 'bold' },
          ' ',
          ' ',
        }

        local function get_grapple_items()
          local tags = grapple.tags()
          local current_file_path = vim.fn.expand '%:p'
          local label = {}

          for id, tag in ipairs(tags) do
            if tag.path == current_file_path then
              table.insert(label, { tostring(id) .. ' ', guifg = '#FFFFFF', gui = 'bold' })
            else
              table.insert(label, { tostring(id) .. ' ', guifg = '#434852' })
            end
          end

          if #label > 0 then
            table.insert(label, 1, { '󰛢 ', guifg = '#CA8BFF' })
          end
          return label
        end

        local grapple_items = get_grapple_items()
        for _, item in ipairs(grapple_items) do
          table.insert(res, item)
        end

        return res
      end,

      -- local function get_harpoon_items()
      --       local marks = harpoon:list().items
      --       local current_file_path = vim.fn.expand '%:p:. '
      --       local label = {}
      --
      --       for id, item in ipairs(marks) do
      --         if item.value == current_file_path then
      --           table.insert(label, { id .. ' ', guifg = '#FFFFFF', gui = 'bold' })
      --         else
      --           table.insert(label, { id .. ' ', guifg = '#434852' })
      --         end
      --       end
      --
      --       if #label > 0 then
      --         table.insert(label, 1, { '󰛢 ', guifg = '#CA8BFF' })
      --       end
      --       return label
      --     end
      --     local harpoon_items = get_harpoon_items()
      --     for _, item in ipairs(harpoon_items) do
      --       table.insert(res, item)
      --     end
      --
      --     -- if ft_icon then
      --     --   table.insert(res, ' ')
      --     --   -- table.insert(res, { '', guifg = '#1A1A1A' })
      --     --   table.insert(res, { ' ', ' ', guibg = '#1A1A1A', guifg = helpers.contrast_color '#1A1A1A' })
      --     --   table.insert(res, { '', guifg = '#1A1A1A' })
      --     -- end
      --
      --     return res
      --   end,
    }

    -- Aqui está o segredo: já desabilita o incline se incline_active for false
    if not incline_active then
      require('incline').disable()
    end
  end,
  keys = {
    {
      '<leader>lq',
      function()
        local loaded = package.loaded['incline']
        if not loaded then
          require('lazy').load { plugins = { 'incline.nvim' } }
        end

        if incline_active then
          require('incline').disable()
          incline_active = false
        else
          require('incline').enable()
          incline_active = true
        end
      end,
      desc = 'Incline: Toggle',
    },
  },
}
