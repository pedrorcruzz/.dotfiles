return {
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'typescript',
        'tsx',
        'bash',
        'c',
        'html',
        'go',
        'lua',
        'markdown',
        'vim',
        'vimdoc',
        'heex',
        'eex',
        'javascript',
        'json5',
        'php',
        'python',
        'php_only',
        'markdown_inline',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      endwise = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
        },
        move = { enable = true, set_jumps = true },
      },
    },
    config = function(_, opts)
      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = 'https://github.com/EmranMR/tree-sitter-blade',
          files = { 'src/parser.c' },
          branch = 'main',
        },
        filetype = 'blade',
      }

      vim.filetype.add {
        pattern = {
          ['.*%.blade%.php'] = 'blade',
          ['.*%.html'] = 'htmldjango',
          ['.*%.html%.jinja'] = 'htmldjango',
          ['.*%.html%.jinja2'] = 'htmldjango',
          ['.*%.html%.j2'] = 'htmldjango',
        },
      }

      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup {
        enable = false,
        max_lines = 0,
      }

      -- local function toggle_context()
      --   local context_enabled = vim.g.treesitter_context_enabled or false
      --   context_enabled = not context_enabled
      --   vim.g.treesitter_context_enabled = context_enabled
      --
      --   require('treesitter-context').setup {
      --     enable = context_enabled,
      --     max_lines = 0,
      --   }
      -- end

      -- vim.keymap.set('n', '<leader>v', toggle_context, { silent = true, desc = 'Toggle: Sticky Scroll' })
    end,
  },
}
