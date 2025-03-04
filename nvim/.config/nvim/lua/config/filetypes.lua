vim.filetype.add {
  pattern = {
    ['.*%.html'] = function(path, bufnr)
      if vim.fn.globpath(vim.fn.getcwd(), 'manage.py') ~= '' then
        return 'htmldjango'
      else
        return 'html'
      end
    end,
  },
}
