return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  branch = 'main',
  opts = {
    provider = 'copilot',
    behaviour = {
      auto_suggestions = false,
    },
    windows = {
      position = 'left',
      width = 30,
    },
    mappings = {
      diff = {
        ours = 'co',
        theirs = 'ct',
        all_theirs = 'ca',
        both = 'cb',
        cursor = 'cc',
        next = ']x',
        prev = '[x',
      },
      suggestion = {
        accept = '<M-l>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      sidebar = {
        apply_all = 'A',
        apply_cursor = 'a',
        retry_user_request = 'r',
        edit_user_request = 'e',
        switch_windows = '<Tab>',
        reverse_switch_windows = '<S-Tab>',
        remove_file = 'd',
        add_file = '@',
        close = { '<Esc>', 'q' },
        close_from_input = nil,
      },
    },
  },
  build = 'make',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true }, -- lazy para otimizar ms
    { 'stevearc/dressing.nvim', lazy = true },
    { 'nvim-lua/plenary.nvim', lazy = true },
    { 'MunifTanjim/nui.nvim', lazy = true },
    -- Dependências opcionais, mantenha comentadas se não usar
    -- { 'nvim-tree/nvim-web-devicons', lazy = true },
    -- { 'echasnovski/mini.icons', lazy = true },
    { 'zbirenbaum/copilot.lua', lazy = true }, -- só carrega se provider for copilot
    -- {
    --   'HakonHarnes/img-clip.nvim',
    --   event = 'VeryLazy',
    --   opts = {
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       use_absolute_path = true,
    --       silent = true,
    --     },
    --   },
    -- },
    -- {
    --   'MeanderingProgrammer/render-markdown.nvim',
    --   opts = {
    --     file_types = { 'markdown', 'Avante' },
    --   },
    --   ft = { 'markdown', 'Avante' },
    --   keys = {
    --     { '<leader>av', '<cmd>AvanteClear<cr>', desc = 'avante: clear' },
    --   },
    -- },
  },
}

-- Caso o plugin não funcione, tente compilar manualmente:
-- cd ~/.local/share/nvim/lazy/avante.nvim
-- make
