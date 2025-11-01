return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'ibhagwan/fzf-lua',
  },
  keys = {
    -- { '<leader>vo', '<cmd>e ~/Developer/second-brain/Segundo\\ Cérebro.md<cr>', desc = 'Open Obsidian Neovim' },
    {
      '<leader>jo',
      function()
        Snacks.picker.smart { cwd = vim.fn.expand '~/Developer/second-brain/' }
      end,
      desc = 'Open Obsidian Neovim',
    },
    { '<leader>jO', '<cmd>ObsidianOpen<cr>', desc = 'Open Obsidian' },
    { '<leader>jd', '<cmd>ObsidianToday<cr>', desc = 'Daily Note' },
    { '<leader>jy', '<CMD>Obsidian today -1<CR>', desc = 'Open Obsidian yesterday note' },
    { '<leader>jt', '<CMD>Obsidian today +1<CR>', desc = 'Open Obsidian tomorrow note' },
    { '<leader>jg', '<cmd>ObsidianDailies<cr>', desc = 'List Dailies' },
    { '<leader>jc', '<cmd>ObsidianCheck<cr>', desc = 'Check' },
    -- { '<leader>jf', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Find Note' },
    { '<leader>js', '<cmd>ObsidianSearch<cr>', desc = 'Search Note' },
    { '<leader>jr', '<cmd>ObsidianRename<cr>', desc = 'Rename' },
    { '<leader>je', '<cmd>ObsidianExtractNote<cr>', desc = 'Extract Note' },
    { '<leader>jl', '<cmd>ObsidianLinkNew<cr>', desc = 'Link New' },
    { '<leader>ja', '<cmd>ObsidianNewFromTemplate<cr>', desc = 'Create Note With Template' },
    { '<leader>jz', '<cmd>ObsidianNew<cr>', desc = 'Create Note' },
    {
      '<leader>jm',
      function()
        return require('obsidian').util.toggle_checkbox()
      end,
      desc = 'Toggle Checkbox',
    },
    { '<leader>jp', '<cmd>ObsidianPasteImage<cr>', desc = 'Paste Image' },

    { '<leader>jf', '<CMD>Obsidian search<CR>', desc = 'Open Obsidian grep picker' },
    { '<leader>jo', '<CMD>Obsidian search<CR>', desc = 'Find note [Obsidian]' },
    { '<leader>jb', '<CMD>Obsidian backlinks<CR>', desc = 'Open Obsidian backlinks picker' },
  },
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'personal',
          path = '~/Developer/second-brain',
        },
        {
          name = 'work',
          path = '~/Developer/second-brain',
          overrides = {
            notes_subdir = 'Home/Anotacoes/NotasRealocar',
          },
        },
      },

      notes_subdir = 'Home/Anotacoes/NotasRealocar',
      log_level = vim.log.levels.INFO,

      daily_notes = {
        folder = 'DailyNotes',
        date_format = 'n-%Y-%m-%d',
        alias_format = '%B %-d, %Y',
        default_tags = { 'diarias' },
        template = 'Templates/template daily note.md',
      },

      completion = {
        blink = true, --cmp
        min_chars = 2,
        create_new = true,
      },

      note_id_func = function(title)
        local suffix = ''
        if title ~= nil then
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          suffix = tostring(os.time())
        end
        return suffix
      end,

      note_path_func = function(spec)
        local path = spec.dir / spec.title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        return path:with_suffix '.md'
      end,

      wiki_link_func = function(opts)
        return require('obsidian.util').wiki_link_id_prefix(opts)
      end,

      markdown_link_func = function(opts)
        return require('obsidian.util').markdown_link(opts)
      end,

      preferred_link_style = 'wiki',
      disable_frontmatter = false,

      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      templates = {
        folder = 'Templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        substitutions = {},
      },

      follow_url_func = function(url)
        vim.fn.jobstart { 'open', url }
      end,

      follow_img_func = function(img)
        vim.fn.jobstart { 'qlmanage', '-p', img }
      end,

      open = {
        func = function(uri)
          vim.ui.open(uri, { cmd = { 'open', '-a', '/Applications/Obsidian.app' } })
        end,
      },

      picker = {
        name = 'snacks.pick', -- snacks.pick telescope.nvim fzf-lua
        note_mappings = {
          new = '<C-x>',
          insert_link = '<C-l>',
        },
        tag_mappings = {
          tag_note = '<C-x>',
          insert_tag = '<C-l>',
        },
      },

      sort_by = 'modified',
      sort_reversed = true,
      search_max_lines = 1000,
      open_notes_in = 'current',

      mappings = {
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- ['<leader>vm'] = {
        --   action = function()
        --     return require('obsidian').util.toggle_checkbox()
        --   end,
        --   opts = { buffer = true },
        -- },
        ['<cr>'] = {
          action = function()
            return require('obsidian').util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },

      ui = {
        enable = false,
        update_debounce = 200,
        max_file_length = 5000,
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
          ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
          ['!'] = { char = '', hl_group = 'ObsidianImportant' },
        },
        bullets = { char = '•', hl_group = 'ObsidianBullet' },
        external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
        reference_text = { hl_group = 'ObsidianRefText' },
        highlight_text = { hl_group = 'ObsidianHighlightText' },
        tags = { hl_group = 'ObsidianTag' },
        block_ids = { hl_group = 'ObsidianBlockID' },
        hl_groups = {
          ObsidianTodo = { bold = true, fg = '#f78c6c' },
          ObsidianDone = { bold = true, fg = '#89ddff' },
          ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
          ObsidianTilde = { bold = true, fg = '#ff5370' },
          ObsidianImportant = { bold = true, fg = '#d73128' },
          ObsidianBullet = { bold = true, fg = '#89ddff' },
          ObsidianRefText = { underline = true, fg = '#c792ea' },
          ObsidianExtLinkIcon = { fg = '#c792ea' },
          ObsidianTag = { italic = true, fg = '#89ddff' },
          ObsidianBlockID = { italic = true, fg = '#89ddff' },
          ObsidianHighlightText = { bg = '#75662e' },
        },
      },

      attachments = {
        img_folder = 'assets/Imagens',
        img_name_func = function()
          return string.format('%s-', os.time())
        end,
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format('![%s](%s)', path.name, path)
        end,
        confirm_img_paste = true,
      },
    }
  end,
}
