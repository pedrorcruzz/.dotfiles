vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    --INFO: Some keymaps are in snacks.lua
    -- map('gd', '<cmd>Telescope lsp_definitions<cr>', 'Goto Definition')
    map('gd', '<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>', 'Goto Definition')
    -- map('<leader>lg', '<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>', 'Goto Definition')
    map('gr', '<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<cr>', 'Goto References')
    map('gI', '<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>', 'Goto Implementation')
    -- map('<leader>lD', '<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<cr>', 'Type Definition')

    map('<leader>lr', vim.lsp.buf.rename, 'Rename')
    -- map('<leader>ld', '<cmd>FzfLua lsp_finder<cr>', 'Find Definition')
    map('<leader>la', vim.lsp.buf.code_action, 'Code Action')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

local severity = vim.diagnostic.severity
vim.diagnostic.config {
  virtual_lines = { true },
  -- virtual_lines = { current_line = true },
  virtual_text = { false },
  -- virtual_text = { current_line = true },
  signs = {
    text = {
      [severity.ERROR] = '󰅚 ',
      [severity.WARN] = '󰀪 ',
      [severity.HINT] = '󰌶 ',
      [severity.INFO] = ' ',
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
}
