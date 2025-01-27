require("telescope").load_extension('harpoon')

lvim.builtin.which_key.mappings["o"] = {
   name = "+Harpoon",
   a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
   d = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Delete" },
   k = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Nav Next" },
   j = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Nav Prev" },
   t = { "<cmd>Telescope harpoon marks<cr>", "Harpoon Marks" },

}
require('harpoon').setup()

require('harpoon').extend {
   UI_CREATE = function(cx)
      vim.keymap.set('n', '<C-v>', function()
         require('harpoon.ui').select_menu_item { vsplit = true }
      end, { buffer = cx.bufnr, desc = "Vertical Split" })

      vim.keymap.set('n', '<C-x>', function()
         require('harpoon.ui').select_menu_item { split = true }
      end, { buffer = cx.bufnr, desc = "Horizontal Split" })

      vim.keymap.set('n', '<C-t>', function()
         require('harpoon.ui').select_menu_item { tabedit = true }
      end, { buffer = cx.bufnr, desc = "Open in New Tab" })
   end,
}
