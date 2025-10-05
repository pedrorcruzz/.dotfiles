local dropbar_active = true

return {
  'Bekaboo/dropbar.nvim',
  event = { 'BufReadPost', 'BufNewFile', 'BufReadPre' },
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  config = function()
    if dropbar_active then
      require('dropbar').setup {}
    end
  end,
  keys = {
    {
      '<leader>zz',
      function()
        require('dropbar.api').pick()
      end,
      mode = 'n',
      desc = 'Pick symbols in winbar',
    },
    {
      '<leader>za',
      function()
        require('dropbar.api').goto_context_start()
      end,
      mode = 'n',
      desc = 'Go to start of current context',
    },
    {
      '<leader>ze',
      function()
        require('dropbar.api').select_next_context()
      end,
      mode = 'n',
      desc = 'Select next context',
    },
    {
      '<leader>lb',
      function()
        dropbar_active = not dropbar_active
        if dropbar_active then
          require('dropbar').setup {}
        else
          vim.api.nvim_set_option_value('winbar', nil, { scope = 'local' })
        end
      end,
      mode = 'n',
      desc = 'Dropbar: Toggle',
    },
  },
}
