-- Configuração do Copilot
return {
  { -- Copilot
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Ativar sugestões automáticas
        keymap = {
          accept = "<Tab>", -- Aceitar sugestão com <Tab>
          next = "<C-]>", -- Ir para próxima sugestão com <C-]>
          prev = "<C-[>", -- Voltar para sugestão anterior com <C-[>
          dismiss = "<C-d>", -- Fechar sugestão com <C-d>
        },
      },
      panel = {
        enabled = true, -- Habilitar painel de sugestões
      },
      experimental = {
        ghost_text = true, -- Ativar ghost text
      },
    },
  },

  {
    "zbirenbaum/copilot-cmp",
    opts = {},
  },
}
