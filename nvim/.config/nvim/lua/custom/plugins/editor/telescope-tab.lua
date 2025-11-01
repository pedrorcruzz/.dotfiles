return {
  'LukasPietzschmann/telescope-tabs',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  cmd = { 'Telescope' },
  keys = {
    -- {
    --   '<leader>tt',
    --   function()
    --     require('telescope').extensions['telescope-tabs'].list_tabs()
    --   end,
    --   desc = 'List Tabs (Telescope)',
    -- },
  },
  config = function()
    local telescope = require 'telescope'
    telescope.load_extension 'telescope-tabs'

    require('telescope-tabs').setup {
      entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
        local tab_name = file_names[1] or '[No Name]'
        return string.format('%d: %s', tab_id, tab_name)
      end,
      show_preview = true,
      close_tab_shortcut_i = '<C-d>',
      close_tab_shortcut_n = 'q',
    }
  end,
}
