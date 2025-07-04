return {
  'linux-cultist/venv-selector.nvim',
  branch = 'regexp',
  lazy = true,
  cmd = { 'VenvSelect', 'VenvSelectCached' },
  ft = { 'python' },
  keys = {
    { '<leader>lxs', '<cmd>VenvSelect<cr>', desc = 'Select virtual environment' },
  },
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    -- telescope (opcional se quiser fuzzy finder para ambientes virtuais)
    -- {
    --   'nvim-telescope/telescope.nvim',
    --   branch = '0.1.x',
    --   dependencies = { 'nvim-lua/plenary.nvim' },
    -- },
  },
  config = function()
    require('venv-selector').setup()
  end,
}
