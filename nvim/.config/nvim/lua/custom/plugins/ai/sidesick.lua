-- lua/plugins/sidekick.lua
return {
  {
    'folke/sidekick.nvim',
    opts = {
      cli = {
        mux = {
          backend = 'zellij',
          enabled = false,
        },
        win = {
          layout = 'left',
          split = {
            width = 60,
            height = 20,
          },
          keys = {
            hide_n = { 'q', 'hide', mode = 'n' },
            hide_ctrl_q_n = { '<c-q>', 'hide', mode = 'n' },
            hide_ctrl_dot = { '<c-.>', 'hide', mode = 't' },
            hide_ctrl_z = { '<c-z>', 'hide', mode = 't' },
            prompt = { '<c-p>', 'prompt', mode = 't' },
            stopinsert = { '<c-q>', 'stopinsert', mode = 't' },
          },
        },
      },
    },
    keys = {
      {
        '<tab>',
        function()
          if not require('sidekick').nes_jump_or_apply() then
            return '<Tab>'
          end
        end,
        expr = true,
        desc = 'Goto/Apply Next Edit Suggestion',
      },
      {
        '<c-.>',
        function()
          require('sidekick.cli').focus()
        end,
        mode = { 'n', 'x', 'i', 't' },
        desc = 'Sidekick Switch Focus',
      },
      {
        '<leader>aa',
        function()
          require('sidekick.cli').toggle { focus = true }
        end,
        desc = 'Sidekick Toggle CLI',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ac',
        function()
          require('sidekick.cli').toggle { name = 'copilot', focus = true }
        end,
        desc = 'Sidekick Copilot Toggle',
        mode = { 'n', 'v' },
      },
      {
        '<leader>aC',
        function()
          require('sidekick.cli').toggle { name = 'claude', focus = true }
        end,
        desc = 'Sidekick Claude Toggle',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ag',
        function()
          require('sidekick.cli').toggle { name = 'grok', focus = true }
        end,
        desc = 'Sidekick Grok Toggle',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ap',
        function()
          require('sidekick.cli').prompt()
        end,
        desc = 'Sidekick Ask Prompt',
        mode = { 'n', 'v' },
      },
    },
  },
  {
    'saghen/blink.cmp',
    opts = {
      keymap = {
        ['<Tab>'] = {
          'snippet_forward',
          function()
            return require('sidekick').nes_jump_or_apply()
          end,
          'fallback',
        },
      },
    },
  },
}
