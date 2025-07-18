return {
  'metalelf0/black-metal-theme-neovim',
  lazy = true,
  config = function()
    require('black-metal').setup {
      highlights = {
        EndOfBuffer = { fg = '#000000', bg = 'none' },
      },
    }
  end,
}
