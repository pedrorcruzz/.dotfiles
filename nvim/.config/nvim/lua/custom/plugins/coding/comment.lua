-- "gc" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  lazy = true,
  keys = {
    { 'gc', mode = { 'n', 'v' }, desc = 'Toggle comment' },
    { 'gb', mode = { 'n', 'v' }, desc = 'Toggle block comment' },
  },
  config = function()
    require('Comment').setup {
      pre_hook = function()
        return vim.bo.commentstring
      end,
    }
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'JoosepAlviste/nvim-ts-context-commentstring',
    {
      'folke/ts-comments.nvim',
      opts = {},
      event = 'VeryLazy',
      enabled = vim.fn.has 'nvim-0.10.0' == 1,
    },
  },
}
