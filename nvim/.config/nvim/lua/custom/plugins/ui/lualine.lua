return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  config = function()
    -- Definição das cores
    local colors = {
      darkgray = "#16161d",
      gray = "#727169",
      branchfg = "#a9a9a9",
      branchbg = nil,
      innerbg = nil,
      outerbg = nil,
      normal = "#64BAFF",
      insert = "#FF7081",
      visual = "#B990F7",
      replace = "#ffa066",
      command = "#75bf63",
      git = "#FFFFFF",
    }

    -- Configuração do Lualine
    require("lualine").setup({
      options = {
        theme = {
          normal = {
            a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
            b = { fg = colors.branchfg, bg = colors.branchbg },
            c = { fg = colors.gray, bg = colors.innerbg },
          },
          insert = {
            a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
          },
          visual = {
            a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
          },
          replace = {
            a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
          },
          command = {
            a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
          },
          inactive = {
            a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
          },
        },
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" }, right_padding = 2 },
          -- { "mode"}
        },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diff",
            symbols = { added = " ", modified = "󰝤 ", removed = " " },
          },
        },
        lualine_x = {
          "diagnostics",
          "copilot",
        },
        lualine_y = { "progress", "filetype", "filename" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
    })
  end,
}

-- Icones para o Lualine
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
