-- Custom Colorscheme
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { fg = '#4c4c4c' })
    vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { fg = '#4c4c4c' })
    vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { fg = '#4c4c4c' })
    vim.api.nvim_set_hl(0, 'BlinkCmpDocSeparator', { fg = '#606060' })
    vim.api.nvim_set_hl(0, 'AvanteInlineHint', { fg = '#606060', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsPurple', { fg = '#AFAFFF', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsAzure', { fg = '#007FFF', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsBlue', { fg = '#0000FF', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsCyan', { fg = '#66ECFF', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsGrey', { fg = '#A0A0A0', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsOrange', { fg = '#FFA500', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsYellow', { fg = '#FFDE21', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsRed', { fg = '#FF2C2C', bg = 'none' })
    vim.api.nvim_set_hl(0, 'MiniIconsGreen', { fg = '#9FF8BB', bg = 'none' })
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
      colorscheme = 'gruvbox', -- min-theme,rusticated,rose-pine,kanagawa-dragon, peachpuff, vesper, catppuccin-mocha, gruvbox
    },
  },
}
