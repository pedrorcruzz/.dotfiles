return {
  'adibhanna/laravel.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/snacks.nvim',
  },
  ft = { 'php', 'blade' },
  keys = {
    -- Core
    { '<leader>pla', ':Artisan<CR>', desc = 'Laravel Artisan' },
    { '<leader>pls', ':LaravelStatus<CR>', desc = 'Laravel Status' },
    { '<leader>plr', ':LaravelRoute<CR>', desc = 'Laravel Routes' },
    { '<leader>plg', ':LaravelMake<CR>', desc = 'Laravel Make' },

    -- Composer
    { '<leader>plci', ':Composer install<CR>', desc = 'Composer Install' },
    { '<leader>plcu', ':Composer update<CR>', desc = 'Composer Update' },
    { '<leader>plcr', ':ComposerRequire ', desc = 'Composer Require Package' },
    { '<leader>plcd', ':ComposerDependencies<CR>', desc = 'Composer Dependencies' },
    { '<leader>plcx', ':ComposerRemove ', desc = 'Composer Remove Package' },

    -- Navigation
    { '<leader>ple', ':LaravelController ', desc = 'Goto Controller' },
    { '<leader>plm', ':LaravelModel ', desc = 'Goto Model' },
    { '<leader>plv', ':LaravelView ', desc = 'Goto View' },
    -- { '<leader>plg', ':LaravelGoto<CR>', desc = 'Laravel Goto Definition' },

    -- Diagrams
    { '<leader>plds', ':LaravelSchema<CR>', desc = 'Show DB Schema' },
    { '<leader>plde', ':LaravelSchemaExport<CR>', desc = 'Export DB Schema' },
    { '<leader>plda', ':LaravelArchitecture<CR>', desc = 'Show App Architecture' },

    -- Cache
    { '<leader>plxc', ':LaravelClearCache<CR>', desc = 'Clear Laravel Cache' },
    { '<leader>plxo', ':LaravelCompletions ', desc = 'Show Laravel Completions' },
  },
  config = function()
    require('laravel').setup {
      notifications = false,
      debug = false,
      keymaps = false,
    }
  end,
}
