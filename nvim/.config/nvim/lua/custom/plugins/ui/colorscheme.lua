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
      colorscheme = 'gruvbox', -- min-theme, vesper, catppuccin-mocha, gruvbox, nightfox, dayfox, emperor, marduk, gorgoroth, khold, venom
    },
  },
}
