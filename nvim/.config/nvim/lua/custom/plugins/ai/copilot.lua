return {
  { -- Copilot
    'zbirenbaum/copilot.lua',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Ativar sugestões automáticas
        keymap = {
          accept = '<Tab>', -- Aceitar sugestão com <Tab>
          next = '<C-]>', -- Ir para próxima sugestão com <C-]>
          prev = '<C-[>', -- Voltar para sugestão anterior com <C-[>
          dismiss = '<C-d>', -- Fechar sugestão com <C-d>
        },
      },
      panel = {
        enabled = true, -- Habilitar painel de sugestões
      },
      experimental = {
        ghost_text = true, -- Ativar ghost text
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
  },
}
