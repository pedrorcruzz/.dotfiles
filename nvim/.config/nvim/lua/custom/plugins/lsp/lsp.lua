return {
  {
    'antosha417/nvim-lsp-file-operations',
    config = true,
    event = { 'BufReadPre', 'BufNewFile' },
  },

  {
    'folke/lazydev.nvim',
    opts = {},
    event = { 'BufReadPre', 'BufNewFile' },
  },
  -- { 'j-hui/fidget.nvim', opts = {} },
}
