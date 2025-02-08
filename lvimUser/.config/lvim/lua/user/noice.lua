require('noice').setup {
   lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
         ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
         ['vim.lsp.util.stylize_markdown'] = true,
         ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
   },
   -- you can enable a preset for easier configuration
   presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- add a border to hover docs and signature help
   },
   routes = {
      {
         filter = {
            event = 'msg_show',
            kind = '',
            find = 'written',
         },
         opts = { skip = true },
      },
      {
         filter = {
            event = 'msg_show',
            kind = 'search_count',
         },
         opts = { skip = true },
      },
   },
   views = {
      cmdline_popup = {
         border = {
            style = "rounded", -- estilos disponíveis: "single", "double", "rounded", "solid"
            padding = { 0, 1 },
         },
         win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" }, -- Altere "DiagnosticInfo" conforme desejado
         },
      },
   },
}

--Borders
vim.defer_fn(function()
   vim.cmd([[highlight NoiceCmdlinePopupBorder guifg=#808080]])
end, 100)

--arrow

vim.defer_fn(function()
   vim.cmd([[highlight NoiceCmdlineIcon guifg=#FFFFFF]])
end, 100)
