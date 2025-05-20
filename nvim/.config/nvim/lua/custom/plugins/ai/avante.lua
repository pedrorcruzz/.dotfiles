return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  branch = 'main',
  opts = {
    provider = 'copilot',
    behaviour = {
      auto_suggestions = false,
    },
    windows = {
      position = 'left', -- 'left', 'right'
      width = 30, -- width of the window
    },
    mappings = {
      --- @class AvanteConflictMappings
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
        close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    -- {
    --   -- support for image pasting
    --   'HakonHarnes/img-clip.nvim',
    --   event = 'VeryLazy',
    --   opts = {
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       -- required for Windows users
    --       use_absolute_path = true,
    --       silent = true,
    --     },
    --   },
    -- },
    -- {
    --   -- Make sure to set this up properly if you have lazy=true
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
