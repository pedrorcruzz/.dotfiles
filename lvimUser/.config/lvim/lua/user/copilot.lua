local ok, copilot = pcall(require, "copilot")
if not ok then
   return
end
copilot.setup({
   suggestion = {
      enabled = true,
      auto_trigger = true, -- Ativar sugestões automáticas
      keymap = {
         accept = "<C-l>",
         next = "<C-]>",
         prev = "<C-[>",
         dismiss = "<C-d>",
      },
   },
   panel = {
      enabled = true, -- Habilitar o painel de sugestões
   },
   experimental = {
      ghost_text = true, -- Ativar o ghost text (texto que aparece em linha com sugestões)
   },
})

vim.keymap.set("i", "<Tab>", function()
   local copilot = require("copilot.suggestion")
   local col = vim.api.nvim_win_get_cursor(0)[2]

   if copilot.is_visible() and col ~= 0 then
      copilot.accept()
   else
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
   end
end, { silent = true })

vim.keymap.set("i", "<S-Tab>", function()
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-d>", true, false, true), "n", false)
end, { silent = true })
