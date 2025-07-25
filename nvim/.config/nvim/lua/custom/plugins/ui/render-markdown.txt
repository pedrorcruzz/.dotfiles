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
    -- { '<leader>ue', '<cmd>RenderMarkdown<cr>', desc = 'Render Markdown: Enable' },
    { '<leader>ut', '<cmd>RenderMarkdown toggle<cr>', desc = 'Render Markdown: Toggle' },
    -- { '<leader>ud', '<cmd>RenderMarkdown disable<cr>', desc = 'Render Markdown: Disable' },
  },
}
