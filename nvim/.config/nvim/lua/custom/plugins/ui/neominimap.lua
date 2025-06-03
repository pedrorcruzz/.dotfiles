---@module "neominimap.config.meta"
return {
  'Isrothy/neominimap.nvim',
  version = 'v3.x.x',
  lazy = true,
  cmd = { 'Neominimap' },
  keys = {
    -- Global Minimap Controls
    { '<leader>,m', '<cmd>Neominimap Toggle<cr>', desc = 'Toggle global minimap' },
    { '<leader>,e', '<cmd>Neominimap Enable<cr>', desc = 'Enable global minimap' },
    { '<leader>,d', '<cmd>Neominimap Disable<cr>', desc = 'Disable global minimap' },
    { '<leader>,r', '<cmd>Neominimap Refresh<cr>', desc = 'Refresh global minimap' },

    -- Window-Specific Minimap Controls
    { '<leader>,wt', '<cmd>Neominimap winToggle<cr>', desc = 'Toggle minimap for current window' },
    { '<leader>,wr', '<cmd>Neominimap winRefresh<cr>', desc = 'Refresh minimap for current window' },
    { '<leader>,we', '<cmd>Neominimap winEnable<cr>', desc = 'Enable minimap for current window' },
    { '<leader>,wd', '<cmd>Neominimap winDisable<cr>', desc = 'Disable minimap for current window' },

    -- Tab-Specific Minimap Controls
    { '<leader>,tt', '<cmd>Neominimap tabToggle<cr>', desc = 'Toggle minimap for current tab' },
    { '<leader>,tr', '<cmd>Neominimap tabRefresh<cr>', desc = 'Refresh minimap for current tab' },
    { '<leader>,te', '<cmd>Neominimap tabOn<cr>', desc = 'Enable minimap for current tab' },
    { '<leader>,td', '<cmd>Neominimap tabOff<cr>', desc = 'Disable minimap for current tab' },

    -- Buffer-Specific Minimap Controls
    { '<leader>,bt', '<cmd>Neominimap BufToggle<cr>', desc = 'Toggle minimap for current buffer' },
    { '<leader>,br', '<cmd>Neominimap bufRefresh<cr>', desc = 'Refresh minimap for current buffer' },
    { '<leader>,be', '<cmd>Neominimap BufEnable<cr>', desc = 'Enable minimap for current buffer' },
    { '<leader>,bd', '<cmd>Neominimap BufDisable<cr>', desc = 'Disable minimap for current buffer' },

    -- Focus Controls
    { '<leader>,f', '<cmd>Neominimap Focus<cr>', desc = 'Focus on minimap' },
    { '<leader>,u', '<cmd>Neominimap Unfocus<cr>', desc = 'Unfocus minimap' },
    { '<leader>,s', '<cmd>Neominimap ToggleFocus<cr>', desc = 'Switch focus on minimap' },
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
