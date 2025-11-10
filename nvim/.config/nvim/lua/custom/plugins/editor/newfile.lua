return {
  'adibhanna/nvim-newfile.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  cmd = { 'NewFileHere', 'NewFile' },
  keys = {
    { '<leader>xa', '<cmd>NewFileHere<cr>', desc = 'New File: Create in Current Directory' },
    { '<leader>xe', '<cmd>NewFile<cr>', desc = 'New File: Create' },
  },
  config = function()
    require('nvim-newfile').setup {
      notifications = {
        enabled = true,
      },
    }
  end,
}
