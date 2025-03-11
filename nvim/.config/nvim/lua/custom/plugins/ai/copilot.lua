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
      { '<leader>ic', '<cmd>CopilotChat<cr>', desc = 'CopilotChat: Open' },
      { '<leader>ir', '<cmd>CopilotChatReset<cr>', desc = 'CopilotChat: Reset' },
      { '<leader>iv', '<cmd>CopilotChatCommit<cr>', desc = 'CopilotChat: Commit' },
      { '<leader>ie', '<cmd>Copilot enablecr>', desc = 'Copilot: Enable' },
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
