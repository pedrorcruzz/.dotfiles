---@module "neominimap.config.meta"
return {
  'Isrothy/neominimap.nvim',
  version = 'v3.x.x',
  lazy = true,
  cmd = { 'Neominimap' },
  keys = {
    -- Global Minimap Controls
    { '<leader>,m', '<cmd>Neominimap toggle<cr>', desc = 'Toggle global minimap' },
    { '<leader>,e', '<cmd>Neominimap on<cr>', desc = 'Enable global minimap' },
    { '<leader>,d', '<cmd>Neominimap off<cr>', desc = 'Disable global minimap' },
    { '<leader>,r', '<cmd>Neominimap refresh<cr>', desc = 'Refresh global minimap' },

    -- Window-Specific Minimap Controls
    { '<leader>,wt', '<cmd>Neominimap winToggle<cr>', desc = 'Toggle minimap for current window' },
    { '<leader>,wr', '<cmd>Neominimap winRefresh<cr>', desc = 'Refresh minimap for current window' },
    { '<leader>,we', '<cmd>Neominimap winOn<cr>', desc = 'Enable minimap for current window' },
    { '<leader>,wd', '<cmd>Neominimap winOff<cr>', desc = 'Disable minimap for current window' },

    -- Tab-Specific Minimap Controls
    { '<leader>,tt', '<cmd>Neominimap tabToggle<cr>', desc = 'Toggle minimap for current tab' },
    { '<leader>,tr', '<cmd>Neominimap tabRefresh<cr>', desc = 'Refresh minimap for current tab' },
    { '<leader>,te', '<cmd>Neominimap tabOn<cr>', desc = 'Enable minimap for current tab' },
    { '<leader>,td', '<cmd>Neominimap tabOff<cr>', desc = 'Disable minimap for current tab' },

    -- Buffer-Specific Minimap Controls
    { '<leader>,bt', '<cmd>Neominimap bufToggle<cr>', desc = 'Toggle minimap for current buffer' },
    { '<leader>,br', '<cmd>Neominimap bufRefresh<cr>', desc = 'Refresh minimap for current buffer' },
    { '<leader>,be', '<cmd>Neominimap bufOn<cr>', desc = 'Enable minimap for current buffer' },
    { '<leader>,bd', '<cmd>Neominimap bufOff<cr>', desc = 'Disable minimap for current buffer' },

    ---Focus Controls
    { '<leader>,f', '<cmd>Neominimap focus<cr>', desc = 'Focus on minimap' },
    { '<leader>,u', '<cmd>Neominimap unfocus<cr>', desc = 'Unfocus minimap' },
    { '<leader>,s', '<cmd>Neominimap toggleFocus<cr>', desc = 'Switch focus on minimap' },
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
