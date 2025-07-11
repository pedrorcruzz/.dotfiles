return {
  'echasnovski/mini.bufremove',
  version = false,
  lazy = true,
  event = 'BufAdd',
  keys = {
    -- { "<leader>bd", function() require("mini.bufremove").delete() end, desc = "Delete Buffer" },
  },
  config = function()
    require('mini.bufremove').setup()
  end,
}
