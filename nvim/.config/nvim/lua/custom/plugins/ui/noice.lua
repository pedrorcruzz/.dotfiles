return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    -- "rcarriga/nvim-notify",
  },
  config = function()
    require('noice').setup {
      cmdline = {
        enabled = true,
        view = 'cmdline_popup',
        opts = {
          position = { row = 0.4, col = 0.5 }, -- Centraliza a popup (50% da altura e largura da tela)
          size = { width = 65, height = 2 },
        },
        format = {
          cmdline = { pattern = '^:', icon = '', lang = 'vim' },
          search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
          search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
          filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
          lua = { pattern = '^:%s*lua%s+', icon = '', lang = 'lua' },
          help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
          input = {},
        },
      },
      messages = {
        enabled = true, -- Desabilita todas as mensagens
        -- view = 'notify', -- Remova ou comente esta linha
        -- view_error = 'notify', -- Remova ou comente esta linha
        -- view_warn = 'notify', -- Remova ou comente esta linha
        -- view_history = 'messages', -- Remova ou comente esta linha
        -- view_search = 'virtualtext', -- Remova ou comente esta linha
      },
      popupmenu = {
        enabled = true,
        backend = 'nui',
        kind_icons = {},
      },
      history = {
        enabled = true,
        view = 'split',
        opts = { enter = true },
        filter = { event = 'msg_show', ['not'] = { kind = { 'search_count', 'echo' } } },
      },
      lsp = {
        progress = {
          enabled = false, -- Desabilita o progresso do LSP
          -- format = 'lsp_progress', -- Remova ou comente esta linha
          -- format_done = 'lsp_progress_done', -- Remova ou comente esta linha
          -- throttle = 1000 / 30, -- Remova ou comente esta linha
          -- view = 'mini', -- Remova ou comente esta linha
        },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          enabled = true,
          silent = false,
          view = nil,
          opts = {},
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
          view = nil,
          opts = {},
        },
        message = {
          enabled = false, -- Desabilita mensagens do LSP
          -- view = 'notify', -- Remova ou comente esta linha
          opts = {},
        },
        documentation = {
          view = 'hover',
          opts = {
            lang = 'markdown',
            replace = true,
            render = 'plain',
            format = { '{message}' },
            win_options = { concealcursor = 'n', conceallevel = 3 },
          },
        },
      },
      markdown = {
        hover = {
          ['|(%S-)|'] = vim.cmd.help,
          ['%[.-%]%((%S-)%)'] = require('noice.util').open,
        },
        highlights = {
          ['|%S-|'] = '@text.reference',
          ['@%S+'] = '@parameter',
          ['^%s*(Parameters:)'] = '@text.title',
          ['^%s*(Return:)'] = '@text.title',
          ['^%s*(See also:)'] = '@text.title',
          ['{%S-}'] = '@parameter',
        },
      },
      health = {
        checker = true,
      },
      smart_move = {
        enabled = true,
        excluded_filetypes = { 'cmp_menu', 'cmp_docs', 'notify' },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      throttle = 1000 / 30,
      views = {},
      routes = {
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'written',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            kind = 'search_count',
          },
          opts = { skip = true },
        },
      },
      status = {},
      format = {},
    }
  end,
}
