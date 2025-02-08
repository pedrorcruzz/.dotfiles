return {
  { -- Copilot
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Ativar sugestões automáticas
        keymap = {
          accept = "<C-l>", -- Aceitar sugestão com <C-l>
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

  -- Configuração das teclas de atalho para <Tab> e <S-Tab>
  config = function()
    vim.keymap.set("i", "<Tab>", function()
      local copilot = require("copilot.suggestion")
      local col = vim.api.nvim_win_get_cursor(0)[2]

      if copilot.is_visible() and col ~= 0 then
        copilot.accept() -- Aceitar a sugestão do Copilot com <Tab>
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end, { silent = true })

    vim.keymap.set("i", "<S-Tab>", function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-d>", true, false, true), "n", false)
    end, { silent = true })
  end,
}
