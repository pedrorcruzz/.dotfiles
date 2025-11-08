return {
  'samharju/yeet.nvim',
  dependencies = {
    'stevearc/dressing.nvim', -- optional, improves UI
  },
  version = '*', -- use latest release
  cmd = 'Yeet',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>ka',
      function()
        require('yeet').list_cmd()
      end,
      desc = 'Yeet: list and create commands',
    },
    {
      '<leader>kk',
      function()
        require('yeet').execute()
      end,
      desc = 'Yeet: execute last command',
    },
    {
      '<leader>kK',
      function()
        require('yeet').execute(nil, { clear_before_yeet = false, interrupt_before_yeet = true })
      end,
      desc = 'Yeet: execute last command without clearing terminal',
    },
    {
      '<leader>kq',
      function()
        require('yeet').execute_selection { yeet_and_run = true, clear_before_yeet = false }
      end,
      mode = { 'v' },
      desc = 'Yeet: execute selected lines',
    },
    {
      '<leader>kt',
      function()
        require('yeet').select_target()
      end,
      desc = 'Yeet: choose execution target',
    },
    {
      '<leader>ks',
      function()
        require('yeet').toggle_post_write()
      end,
      desc = 'Yeet: toggle run on save',
    },
    {
      '<leader>ko',
      function()
        require('yeet').setqflist { open = true }
      end,
      desc = 'Yeet: send output to quickfix list',
    },
  },
}
