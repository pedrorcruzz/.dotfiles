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
  -- event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries

  keys = {
    { '<leader>pgr', '<cmd>GoRun<cr>', desc = 'Go Run' },
    { '<leader>pgb', '<cmd>GoBuild<cr>', desc = 'Go Build' },
    { '<leader>pgo', '<cmd>GoModTidy<cr>', desc = 'Go Mod Tidy' },
    { '<leader>pge', '<cmd>GoEnv<cr>', desc = 'Go Env' },
    { '<leader>pgE', '<cmd>GoEnum<cr>', desc = 'Go Enum' },
    { '<leader>pgs', '<cmd>GoFillStruct<cr>', desc = 'Go Fill Struct' },
    { '<leader>pgD', '<cmd>GoDocBrowser<cr>', desc = 'Go Doc Browser' },
    { '<leader>pgi', '<cmd>GoImports<cr>', desc = 'Go Imports' },
    { '<leader>pgm', '<cmd>GoMockGen<cr>', desc = 'Go Mock Generator' },

    --DEBUG
    { '<leader>pgdd', '<cmd>GoDebug<cr>', desc = 'Go Debug' },
    { '<leader>pgdt', '<cmd>GoBreakToggle<cr>', desc = 'Go Break Toggle' },
    { '<leader>pgdS', '<cmd>GoBreakSave<cr>', desc = 'Go Break Save' },
    { '<leader>pgdl', '<cmd>GoBreakLoad<cr>', desc = 'Go Break Load' },
    { '<leader>pgdc', '<cmd>GoDbgContinue<cr>', desc = 'Go Continue' },
    { '<leader>pgdk', '<cmd>GoDbgKeys<cr>', desc = 'Go Keys' },
    { '<leader>pgds', '<cmd>GoDbgStop<cr>', desc = 'Go Stop' },

    --Test
    { '<leader>pgta', '<cmd>GoAddTest<cr>', desc = 'Go Add Test' },
    { '<leader>pgtA', '<cmd>GoAddAllTest<cr>', desc = 'Go Add All Test' },
    { '<leader>pgte', '<cmd>GoAddExpTest<cr>', desc = 'Go Add Exp Test' },
    { '<leader>pgtf', '<cmd>GoTestFunc<cr>', desc = 'Go Test Func' },
    { '<leader>pgtF', '<cmd>GoTestFile<cr>', desc = 'Go Test File' },
    { '<leader>pgtt', '<cmd>GoTest<cr>', desc = 'Go Test' },
    { '<leader>pgts', '<cmd>GoTestSum<cr>', desc = 'Go Test Sum' },
  },
}
