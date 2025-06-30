local start_active = false

return {
  'sphamba/smear-cursor.nvim',
  event = 'VeryLazy',
  opts = {
    stiffness = 0.8, -- 0.6      [0, 1]
    trailing_stiffness = 0.5, -- 0.4      [0, 1]
    stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    damping = 0.8, -- 0.65     [0, 1]
    damping_insert_mode = 0.8, -- 0.7      [0, 1]
    distance_stop_animating = 0.5,
    cursor_color = '#1CA9D8',
  },
  config = function(_, opts)
    local smear = require 'smear_cursor'
    smear.setup(opts)

    if not start_active then
      smear.toggle()
    end

    vim.keymap.set('n', '<leader>lb', function()
      smear.toggle()
    end, { desc = 'Toggle Smear Cursor' })
  end,
}
