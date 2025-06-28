return {
  'adibhanna/laravel.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>pla', ':LaravelArtisan<cr>', desc = 'Laravel Artisan' },
    { '<leader>plr', ':LaravelRoute<cr>', desc = 'Laravel Routes' },
    { '<leader>plm', ':LaravelMake<cr>', desc = 'Laravel Make' },
  },
  config = function()
    require('laravel').setup()
  end,
}
