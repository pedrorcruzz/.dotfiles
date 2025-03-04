return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
  keys = {
    { '<leader>ua', '<cmd>MarkdownPreview<cr>', desc = 'Markdown Preview: Open' },
    { '<leader>ut', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview: Toggle' },
    { '<leader>us', '<cmd>MarkdownPreviewStop<cr>', desc = 'Markdown Preview: Stop' },
    -- { '<leader>ur', '<cmd>RenderMarkdown toggle<cr>', desc = 'RenderMarkdown: Toggle' },
    { '<leader>uv', '<cmd>Markview Toggle<cr>', desc = 'Markview: Toggle' },
  },
}
