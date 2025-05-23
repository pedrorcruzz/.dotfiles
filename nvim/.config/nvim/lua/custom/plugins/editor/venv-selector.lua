return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python', --optional
    -- { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  lazy = true, -- Alterado para true para otimizar o carregamento
  cmd = { 'VenvSelect', 'VenvSelectCached' }, -- Carrega quando os comandos forem usados
  ft = { 'python' }, -- Carrega apenas em arquivos Python
  branch = 'regexp', -- This is the regexp branch, use this for the new version
  config = function()
    require('venv-selector').setup()
  end,
  keys = {
    { '<leader>lxs', '<cmd>VenvSelect<cr>', desc = 'Select virtual environment' },
  },
}
