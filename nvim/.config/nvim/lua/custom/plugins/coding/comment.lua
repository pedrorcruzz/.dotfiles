return {
  'numToStr/Comment.nvim',
  lazy = true,
  keys = {
    { 'gc', mode = { 'n', 'v' }, desc = 'Toggle comment' },
    { 'gb', mode = { 'n', 'v' }, desc = 'Toggle block comment' },
  },
  config = function()
    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
}
