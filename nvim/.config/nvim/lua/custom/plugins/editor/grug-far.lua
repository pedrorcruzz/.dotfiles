return {
  'MagicDuck/grug-far.nvim',
  lazy = true,
  cmd = { 'GrugFar' },
  keys = {
    { '<leader>le', '<cmd>GrugFar<cr>', desc = 'GrugFar' },
  },
  config = function()
    require('grug-far').setup {
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    }
  end,
}
