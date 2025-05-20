return {
  { -- Copilot
    'zbirenbaum/copilot.lua',
    cond = function()
      local handle = io.popen 'ping -c 1 github.com >/dev/null 2>&1 && echo ok || echo fail'
      local result = handle:read '*a'
      handle:close()
      return result:match 'ok'
    end,
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<Tab>',
          next = '<C-]>',
          prev = '<C-[>',
          dismiss = '<C-d>',
        },
      },
      panel = {
        enabled = true,
      },
      experimental = {
        ghost_text = true,
      },
    },
    keys = {
      { '<leader>ia', '<cmd>Copilot auth<cr>', desc = 'Copilot: Auth' },
      { '<leader>ie', '<cmd>Copilot enable<cr>', desc = 'Copilot: Enable' },
      { '<leader>id', '<cmd>Copilot disable<cr>', desc = 'Copilot: Disable' },
      { '<leader>it', '<cmd>Copilot toggle<cr>', desc = 'Copilot: Toggle' },
      { '<leader>ip', '<cmd>Copilot panel<cr>', desc = 'Copilot: Panel' },
    },
  },

  {
    'zbirenbaum/copilot-cmp',
    opts = {},
    cond = function()
      local handle = io.popen 'ping -c 1 github.com >/dev/null 2>&1 && echo ok || echo fail'
      local result = handle:read '*a'
      handle:close()
      return result:match 'ok'
    end,
  },
}
