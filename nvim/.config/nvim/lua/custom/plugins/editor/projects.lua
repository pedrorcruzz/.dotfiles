return {
  {
    'coffebar/neovim-project',
    opts = {
      projects = { -- define project roots
        '~/Developer/Projects/*',
        '~/Developer/Studies/*',
        '~/Developer/Freelas/*',
        '~/Developer/Cesmac/*',
        '~/Developer/Seven/*',
        '~/Developer/Guru/*',
      },
      -- Path to store history and sessions
      datapath = vim.fn.stdpath 'data', -- ~/.local/share/nvim/
      -- Load the most recent session on startup if not in the project directory
      last_session_on_startup = false,
      -- Dashboard mode prevents session autoload on startup
      dashboard_mode = true,
      -- Timeout to trigger FileType autocmd after session load (for LSP attachment)
      filetype_autocmd_timeout = 200,
      -- Keymap to delete project from history in Telescope picker
      forget_project_keys = {
        i = '<C-d>', -- insert mode: Ctrl+d
        n = 'd', -- normal mode: d
      },
      -- Overwrite some of Session Manager options
      session_manager_opts = {
        autosave_ignore_dirs = {
          vim.fn.expand '~', -- don't create a session for $HOME/
          '/tmp',
        },
        autosave_ignore_filetypes = {
          'ccc-ui',
          'gitcommit',
          'gitrebase',
          'qf',
          'toggleterm',
        },
      },
      -- Picker configuration
      picker = {
        type = 'fzf-lua', -- or "telescope"
      },
    },
    init = function()
      -- Enable saving the state of plugins in the session
      vim.opt.sessionoptions:append 'globals'
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' }, -- optional picker
      { 'ibhagwan/fzf-lua' }, -- optional picker
      { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
  },
}
