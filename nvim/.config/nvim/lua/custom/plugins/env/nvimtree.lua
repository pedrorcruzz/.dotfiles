return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim", -- Adiciona suporte ao Git Signs
  },
  config = function()
    -- Configuração do Git Signs
    require("gitsigns").setup()

    -- Configuração do Nvim Tree
    require("nvim-tree").setup({
      disable_netrw = false,
      hijack_netrw = true,
      sync_root_with_cwd = true,
      view = {
        width = 34,
        side = "left",
        centralize_selection = true,
        cursorline = true,
        signcolumn = "yes",
        number = false,
        relativenumber = false,
      },
      renderer = {
        highlight_git = true, -- Habilita destaque para Git
        highlight_opened_files = "name",
        indent_markers = {
          enable = false,
          inline_arrows = true,
        },
        icons = {
          git_placement = "signcolumn", -- Mostra os ícones do Git na coluna de sinais
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            git = {
              unstaged = "", -- Arquivo modificado
              staged = "", -- Arquivo adicionado ao staging
              unmerged = "", -- Conflito de merge
              renamed = "➜", -- Arquivo renomeado
              deleted = "", -- Arquivo deletado
              untracked = "★", -- Arquivo não rastreado
              ignored = "◌", -- Arquivo ignorado pelo Git
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      filters = {
        dotfiles = false,
        custom = { ".cache" },
      },
      git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = false,
        },
      },
    })

    vim.cmd([[
			highlight NvimTreeGitDirty guifg=#e0af68
			highlight NvimTreeGitNew guifg=#89b4fa
			highlight NvimTreeGitDeleted guifg=#f7768e
			highlight NvimTreeGitStaged guifg=#9ece6a
			highlight NvimTreeGitMerge guifg=#bb9af7
			highlight NvimTreeGitRenamed guifg=#ff9e64
			highlight NvimTreeGitIgnored guifg=#737aa2
		]])
  end,
}
