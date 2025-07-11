return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    { '<leader>ue', '<cmd>RenderMarkdown<cr>', desc = 'Render Markdown: Enable' },
    { '<leader>uv', '<cmd>RenderMarkdown toggle<cr>', desc = 'Render Markdown: Toggle' },
    -- { '<leader>uv', '<cmd>Markview Toggle<cr>', desc = 'Markview: Toggle' },
    { '<leader>ud', '<cmd>RenderMarkdown disable<cr>', desc = 'Render Markdown: Disable' },
    { '<leader>ua', '<cmd>MarkdownPreview<cr>', desc = 'Markdown Preview: Open' },
    { '<leader>ut', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview: Toggle' },
    { '<leader>us', '<cmd>MarkdownPreviewStop<cr>', desc = 'Markdown Preview: Stop' },
  },
}
