return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- Configuração do Harpoon
    harpoon:setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    })

    -- Mapeamento dos atalhos para Harpoon
    local keys = {
      -- Harpoon Group
      {
        "<leader>oa",
        function()
          harpoon:list():add()
        end,
        desc = "Add File",
      },
      {
        "<leader>od",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Delete",
      },
      {
        "<leader>ok",
        function()
          harpoon:list():next()
        end,
        desc = "Nav Next",
      },
      {
        "<leader>oj",
        function()
          harpoon:list():prev()
        end,
        desc = "Nav Prev",
      },
      { "<leader>of", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon Marks" },

      -- Navegação de arquivos
      {
        "<C-p>",
        function()
          harpoon:list():prev()
        end,
        mode = "n",
        desc = "Previous Harpoon Buffer",
      },
      {
        "<C-n>",
        function()
          harpoon:list():next()
        end,
        mode = "n",
        desc = "Next Harpoon Buffer",
      },

      -- Splits e Tabs no menu do Harpoon
      {
        "<C-v>",
        function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end,
        mode = "n",
        desc = "Vertical Split",
      },
      {
        "<C-x>",
        function()
          harpoon.ui:select_menu_item({ split = true })
        end,
        mode = "n",
        desc = "Horizontal Split",
      },
      {
        "<C-t>",
        function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end,
        mode = "n",
        desc = "Open in New Tab",
      },
    }

    -- Registrar as teclas de atalho
    for _, key in ipairs(keys) do
      vim.keymap.set(key.mode or "n", key[1], key[2], { desc = key.desc })
    end
  end,
}
