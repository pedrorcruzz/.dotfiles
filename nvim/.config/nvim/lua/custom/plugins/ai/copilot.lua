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
      { '<leader>pa', '<cmd>Copilot auth<cr>', desc = 'Copilot: Auth' },
      { '<leader>pe', '<cmd>Copilot enablecr>', desc = 'Copilot: Enable' },
      { '<leader>pd', '<cmd>Copilot disable<cr>', desc = 'Copilot: Disable' },
      { '<leader>pt', '<cmd>Copilot toggle<cr>', desc = 'Copilot: Toggle' },
      { '<leader>pp', '<cmd>Copilot panel<cr>', desc = 'Copilot: Panel' },
    },
  },

  {
    'zbirenbaum/copilot-cmp',
    opts = {},
  },
}
