vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.html',
  callback = function()
    local manage_py = vim.fn.findfile('manage.py', vim.fn.getcwd() .. ';')
    if manage_py ~= '' then
      vim.bo.filetype = 'htmldjango'
    else
      vim.bo.filetype = 'html'
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact',
    'json',
  },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'go',
    'php',
  },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = false
  end,
})
