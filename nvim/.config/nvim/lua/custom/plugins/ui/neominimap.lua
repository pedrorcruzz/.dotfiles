---@module "neominimap.config.meta"
return {
  'Isrothy/neominimap.nvim',
  version = 'v3.x.x',
  lazy = false, -- NOTE: NO NEED to Lazy load
  -- Optional. You can alse set your own keybindings
  keys = {
    -- Global Minimap Controls
    { '<leader>vm', '<cmd>Neominimap toggle<cr>', desc = 'Toggle global minimap' },
    { '<leader>ve', '<cmd>Neominimap on<cr>', desc = 'Enable global minimap' },
    { '<leader>vd', '<cmd>Neominimap off<cr>', desc = 'Disable global minimap' },
    { '<leader>vr', '<cmd>Neominimap refresh<cr>', desc = 'Refresh global minimap' },

    -- Window-Specific Minimap Controls
    { '<leader>vwt', '<cmd>Neominimap winToggle<cr>', desc = 'Toggle minimap for current window' },
    { '<leader>vwr', '<cmd>Neominimap winRefresh<cr>', desc = 'Refresh minimap for current window' },
    { '<leader>vwe', '<cmd>Neominimap winOn<cr>', desc = 'Enable minimap for current window' },
    { '<leader>vwd', '<cmd>Neominimap winOff<cr>', desc = 'Disable minimap for current window' },

    -- Tab-Specific Minimap Controls
    { '<leader>vtt', '<cmd>Neominimap tabToggle<cr>', desc = 'Toggle minimap for current tab' },
    { '<leader>vtr', '<cmd>Neominimap tabRefresh<cr>', desc = 'Refresh minimap for current tab' },
    { '<leader>vte', '<cmd>Neominimap tabOn<cr>', desc = 'Enable minimap for current tab' },
    { '<leader>vtd', '<cmd>Neominimap tabOff<cr>', desc = 'Disable minimap for current tab' },

    -- Buffer-Specific Minimap Controls
    { '<leader>vbt', '<cmd>Neominimap bufToggle<cr>', desc = 'Toggle minimap for current buffer' },
    { '<leader>vbr', '<cmd>Neominimap bufRefresh<cr>', desc = 'Refresh minimap for current buffer' },
    { '<leader>vbe', '<cmd>Neominimap bufOn<cr>', desc = 'Enable minimap for current buffer' },
    { '<leader>vbd', '<cmd>Neominimap bufOff<cr>', desc = 'Disable minimap for current buffer' },

    ---Focus Controls
    { '<leader>vf', '<cmd>Neominimap focus<cr>', desc = 'Focus on minimap' },
    { '<leader>vu', '<cmd>Neominimap unfocus<cr>', desc = 'Unfocus minimap' },
    { '<leader>vs', '<cmd>Neominimap toggleFocus<cr>', desc = 'Switch focus on minimap' },
  },
  init = function()
    -- The following options are recommended when layout == "float"
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    --- Put your configuration here
    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = false,
    }
  end,
}
