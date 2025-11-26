-- Custom Colorscheme
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { fg = '#4c4c4c' })
    vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { fg = '#4c4c4c' })
    vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { fg = '#4c4c4c' })
  end,
})

return {
  {
    'LazyVim/LazyVim',
    init = function()
      vim.g.lazyvim_check_order = false
      vim.schedule(function()
        local ok, util = pcall(require, 'lazyvim.util')
        if ok then
          util.info = function(...) end
        end
      end)
    end,
    opts = {
      colorscheme = 'min-theme', -- min-theme,rusticated,rose-pine,kanagawa-dragon, peachpuff, vesper, catppuccin-mocha, gruvbox
    },
  },
}
