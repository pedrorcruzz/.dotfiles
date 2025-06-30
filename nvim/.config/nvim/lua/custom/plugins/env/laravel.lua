rettrueurn {
  'adibhanna/laravel.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/snacks.nvim',
  },
  ft = { 'php', 'blade' },
  keys = {
    -- Core
    { '<leader>pla', '<cmd>Artisan<cr>', desc = 'Laravel Artisan' },
    { '<leader>pls', '<cmd>LaravelStatus<cr>', desc = 'Laravel Status' },
    { '<leader>plr', '<cmd>LaravelRoute<cr>', desc = 'Laravel Routes' },
    { '<leader>plg', '<cmd>LaravelMake<cr>', desc = 'Laravel Make' },

    -- Composer
    { '<leader>plci', '<cmd>Composer install<cr>', desc = 'Composer Install' },
    { '<leader>plcu', '<cmd>Composer update<cr>', desc = 'Composer Update' },
    { '<leader>plcr', '<cmd>ComposerRequire<cr> ', desc = 'Composer Require Package' },
    { '<leader>plcd', '<cmd>ComposerDependencies<cr>', desc = 'Composer Dependencies' },
    { '<leader>plcx', '<cmd>ComposerRemove<cr> ', desc = 'Composer Remove Package' },

    -- Navigation
    { '<leader>ple', '<cmd>LaravelController<cr> ', desc = 'Goto Controller' },
    { '<leader>plm', '<cmd>LaravelModel<cr> ', desc = 'Goto Model' },
    { '<leader>plv', '<cmd>LaravelView<cr> ', desc = 'Goto View' },
    -- { '<leader>plg', '<cmd>LaravelGoto<cr>', desc = 'Laravel Goto Definition' },

    -- Diagrams
    { '<leader>plds', '<cmd>LaravelSchema<cr>', desc = 'Show DB Schema' },
    { '<leader>plde', '<cmd>LaravelSchemaExport<cr>', desc = 'Export DB Schema' },
    { '<leader>plda', '<cmd>LaravelArchitecture<cr>', desc = 'Show App Architecture' },

    -- Cache
    { '<leader>plxc', '<cmd>LaravelClearCache<cr>', desc = 'Clear Laravel Cache' },
    { '<leader>plxo', '<cmd>LaravelCompletions<cr> ', desc = 'Show Laravel Completions' },
  },
  config = function()
    require('laravel').setup {
      notifications = false,
      debug = false,
      keymaps = false,
    }
  end,
}
