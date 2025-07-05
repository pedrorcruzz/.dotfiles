return {
  'adibhanna/laravel.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
  },
  ft = { 'php', 'blade' },
  keys = {
    -- Core
    { '<leader>pla', '<cmd>Artisan<cr>', desc = 'Laravel Artisan' },
    { '<leader>pls', '<cmd>LaravelStatus<cr>', desc = 'Laravel Status' },
    { '<leader>plr', '<cmd>LaravelRoute<cr>', desc = 'Laravel Routes' },
    { '<leader>plg', '<cmd>LaravelMake<cr>', desc = 'Laravel Make' },

    -- Composer
    { '<leader>plcc', ':Composer', desc = 'Composer [name]' },
    { '<leader>plci', ':Composer install', desc = 'Composer Install' },
    { '<leader>plcu', '<cmd>Composer update<cr>', desc = 'Composer Update' },
    { '<leader>plcr', '<cmd>ComposerRequire<cr> ', desc = 'Composer Require Package' },
    { '<leader>plcd', '<cmd>ComposerDependencies<cr>', desc = 'Composer Dependencies' },
    { '<leader>plcx', '<cmd>ComposerRemove<cr> ', desc = 'Composer Remove Package' },

    -- Navigation
    { '<leader>ple', '<cmd>LaravelController<cr> ', desc = 'Goto Controller' },
    { '<leader>plm', '<cmd>LaravelModel<cr> ', desc = 'Goto Model' },
    { '<leader>plv', '<cmd>LaravelView<cr> ', desc = 'Goto View' },
    { '<leader>pll', '<cmd>LaravelGoto<cr>', desc = 'Laravel Goto Definition' },

    -- Diagrams
    { '<leader>plds', '<cmd>LaravelSchema<cr>', desc = 'Show DB Schema' },
    { '<leader>plde', '<cmd>LaravelSchemaExport<cr>', desc = 'Export DB Schema' },
    { '<leader>plda', '<cmd>LaravelArchitecture<cr>', desc = 'Show App Architecture' },

    -- Cache
    { '<leader>plxx', ':LaravelCompletions', desc = 'Show Laravel Completions [type]' },
    { '<leader>plxc', '<cmd>LaravelClearCache<cr>', desc = 'Clear Laravel Cache' },
    { '<leader>plxo', '<cmd>LaravelCompletions<cr> ', desc = 'Show Laravel Completions' },

    -- IDE Helper
    { '<leader>plhh', ':LaravelIdeHelper', desc = 'Generate IDE Helper files [action]' },
    { '<leader>plhi', '<cmd>LaravelInstallIdeHelper<cr>', desc = 'Install Laravel IDE Helper package' },
    { '<leader>plhc', '<cmd>LaravelIdeHelperCheck<cr> ', desc = 'Check IDE Helper status and files' },
    { '<leader>plhg', '<cmd>LaravelIdeHelper<cr>', desc = 'Generate IDE Helper files' },
    { '<leader>plhr', '<cmd>LaravelIdeHelperClean<cr> ', desc = 'Remove generated files (keep package)' },
    { '<leader>plhu', '<cmd>LaravelRemoveIdeHelper<cr> ', desc = 'Completely remove IDE Helper package and files' },

    -- Laravel Sail
    { '<leader>plnn', ':Sail', desc = 'Run Sail command [command]' },
    { '<leader>plnu', '<cmd>SailUp<cr>', desc = 'Start Sail containers' },
    { '<leader>plnd', '<cmd>SailDown<cr>', desc = 'Stop Sail containers' },
    { '<leader>plnr', '<cmd>SailRestart<cr>', desc = 'Restart Sail containers' },
    { '<leader>plnt', '<cmd>SailTest<cr>', desc = 'Run tests throught Sail' },
    { '<leader>plns', '<cmd>SailShare<cr>', desc = 'Share application via tunnel' },
    { '<leader>plno', '<cmd>SailShell<cr>', desc = 'Open shell in container' },
  },
  config = function()
    require('laravel').setup {
      notifications = false,
      debug = false,
      keymaps = false,
      sail = {
        enabled = true,
        auto_detect = true,
      },
    }
  end,
}
