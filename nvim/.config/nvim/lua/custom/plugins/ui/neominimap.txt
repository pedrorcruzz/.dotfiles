---@module "neominimap.config.meta"
return {
  'Isrothy/neominimap.nvim',
  version = 'v3.x.x',
  lazy = true,
  cmd = { 'Neominimap' },
  keys = {
    -- Global Minimap Controls
    { '<leader>zm', '<cmd>Neominimap Toggle<cr>', desc = 'Toggle global minimap' },
    { '<leader>ze', '<cmd>Neominimap Enable<cr>', desc = 'Enable global minimap' },
    { '<leader>zd', '<cmd>Neominimap Disable<cr>', desc = 'Disable global minimap' },
    { '<leader>zr', '<cmd>Neominimap Refresh<cr>', desc = 'Refresh global minimap' },

    -- Window-Specific Minimap Controls
    { '<leader>zwt', '<cmd>Neominimap winToggle<cr>', desc = 'Toggle minimap for current window' },
    { '<leader>zwr', '<cmd>Neominimap winRefresh<cr>', desc = 'Refresh minimap for current window' },
    { '<leader>zwe', '<cmd>Neominimap winEnable<cr>', desc = 'Enable minimap for current window' },
    { '<leader>zwd', '<cmd>Neominimap winDisable<cr>', desc = 'Disable minimap for current window' },

    -- Tab-Specific Minimap Controls
    { '<leader>ztt', '<cmd>Neominimap tabToggle<cr>', desc = 'Toggle minimap for current tab' },
    { '<leader>ztr', '<cmd>Neominimap tabRefresh<cr>', desc = 'Refresh minimap for current tab' },
    { '<leader>zte', '<cmd>Neominimap tabOn<cr>', desc = 'Enable minimap for current tab' },
    { '<leader>ztd', '<cmd>Neominimap tabOff<cr>', desc = 'Disable minimap for current tab' },

    -- Buffer-Specific Minimap Controls
    { '<leader>zbt', '<cmd>Neominimap BufToggle<cr>', desc = 'Toggle minimap for current buffer' },
    { '<leader>zbr', '<cmd>Neominimap bufRefresh<cr>', desc = 'Refresh minimap for current buffer' },
    { '<leader>zbe', '<cmd>Neominimap BufEnable<cr>', desc = 'Enable minimap for current buffer' },
    { '<leader>zbd', '<cmd>Neominimap BufDisable<cr>', desc = 'Disable minimap for current buffer' },

    -- Focus Controls
    { '<leader>zf', '<cmd>Neominimap Focus<cr>', desc = 'Focus on minimap' },
    { '<leader>zu', '<cmd>Neominimap Unfocus<cr>', desc = 'Unfocus minimap' },
    { '<leader>zs', '<cmd>Neominimap ToggleFocus<cr>', desc = 'Switch focus on minimap' },
  },
  init = function()
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36

    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = false,
    }
  end,
}
