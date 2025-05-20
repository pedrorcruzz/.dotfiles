return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup()
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries

  keys = {
    { '<leader>pgr', '<cmd>GoRun<cr>', desc = 'Go Run' },
    { '<leader>pgb', '<cmd>GoBuild<cr>', desc = 'Go Build' },

    --DEBUG
    { '<leader>pgdt', '<cmd>GoBreakToggle<cr>', desc = 'Go Break Toggle' },
    { '<leader>pgds', '<cmd>GoBreakSave<cr>', desc = 'Go Break Save' },
    { '<leader>pgdl', '<cmd>GoBreakLoad<cr>', desc = 'Go Break Load' },
  },
}
