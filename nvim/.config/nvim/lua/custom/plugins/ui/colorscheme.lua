local function set_theme(theme)
  vim.cmd('colorscheme ' .. theme)
end

local default_theme = 'min-theme'

return {
  {
    'datsfilipe/min-theme.nvim',
    config = function()
      local transparent_background = true
      require('min-theme').setup {
        theme = 'dark',
        transparent = transparent_background,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },
        overrides = {
          normal = { bg = transparent_background and 'none' or '#202020' },
          visual = { bg = transparent_background and '#4c4c4c' or '#606060' },
          -- cursorline = { bg = transparent_background and "none" or "#323232" },
          cursorline = { bg = '#323232' },
          linenr = { fg = '#4b5263' },
          normalfloat = { fg = '#abb2bf', bg = transparent_background and 'none' or '#202020' },
          floatborder = { fg = '#4c4c4c' },
          search = { bg = '#606060', fg = '#abb2bf' },
          incsearch = { bg = '#606060', fg = '#ff657e' },
          avanteinlinehint = { fg = '#abb2bf' },

          matchparen = { fg = '#abb2bf' },
          ['@markup.heading.1.markdown'] = { fg = '#abb2bf' },
          --underline cmp preview
          ['@punctuation.special'] = { fg = '#323232' },

          --htmldjango
          ['@punctuation.special.htmldjango'] = { fg = '#abb2bf' },

          --todo
          todobgtodo = { bg = '#64baff', fg = '#111111', bold = true },
          todobgnote = { bg = '#c18efe', fg = '#111111', bold = true },
          todobgwarn = { bg = '#ffa868', fg = '#111111', bold = true },
          todobgfix = { bg = '#ff657e', fg = '#111111', bold = true },
          -- todobghack = { bg = '#c18efe', fg = '#111111', bold = true },

          --diagnostic
          -- diagnosticerror = { fg = '#be5046' },
          diagnosticwarn = { fg = '#ffa868' },
          diagnosticinfo = { fg = '#64baff' },
          diagnostichint = { fg = '#c18efe' },
          todofgtodo = { fg = '#64baff' },
          todofgnote = { fg = '#c18efe' },
          todofgwarn = { fg = '#ffa868' },
          todofgfix = { fg = '#ff657e' },
          -- todofghack = { fg = '#c18efe' },
          --
          -- snacks notifier
          snacksnotifierborderinfo = { fg = '#4c4c4c' },
          snacksnotifierborderwarn = { fg = '#ffa868' },
          snacksnotifierbordererror = { fg = '#ff657e' },
          snacksnotifiertitleinfo = { fg = '#ffffff' },

          snackspickertitle = { fg = '#ffffff' },
          snackspickerinputtitle = { fg = '#abb2bf' },
          snackspickertoggle = { fg = '#abb2bf' },

          snacksinputicon = { fg = '#abb2bf' }, --#ff657e
          snacksinputtitle = { fg = '#ffffff' },
          snacksinputborder = { fg = '#4c4c4c' },

          snacksindent = { fg = '#4c4c4c' },
          snacksindentscope = { fg = '#abb2bf' },
          snacksindentunderline_snacksindentscope = { fg = '#abb2bf' },

          snacksdashboarddesc = { fg = '#ffffff' },
          snacksdashboarddir = { fg = '#4c4c4c' },
          snacksdashboardheader = { fg = '#c18efe' },
          snacksdashboardfooter = { fg = '#c18efe' },
          snacksdashboardicon = { fg = '#c18efe' },
          snacksdashboardfile = { fg = '#ffffff' },
          snacksdashboardtitle = { fg = '#ffffff' },
          -- snacksdashboardspecial = { fg = '#ff657e' },
          snacksdashboardnormal = { fg = '#4b4f6b' },

          -- noice
          noiceconfirmborder = { fg = '#4c4c4c' },
          noicecmdlineprompt = { fg = '#4c4c4c' },
          noicecmdlinepopupborder = { fg = '#4c4c4c' },
          noicecmdlinepopuptitlecmdline = { fg = '#ffffff' },
          noicecmdlinepopuptitle = { fg = '#ffffff' },
          noicecmdlinetitle = { fg = '#ffffff' },
          noicecmdlineicon = { fg = '#abb2bf' }, --#ffffff

          -- whichkey
          whichkeytitle = { fg = '#abb2bf' },
          whichkeygroup = { fg = '#abb2bf' },

          -- fzf
          fzfluaborder = { fg = '#4c4c4c' },
          fzfluaheadertext = { fg = '#abb2bf' },
          fzfluadiricon = { fg = '#abb2bf' },
          fzfluaheaderbind = { fg = '#ffffff' },
          fzfluatabtitle = { fg = '#ffffff' },
          fzfluasearch = { fg = '#ffffff' },

          -- nvim tree
          nvimtreenormal = { bg = transparent_background and 'none' or '#1a1a1a' },
          nvimtreeendofbuffer = { fg = '#1a1a1a', bg = nil }, -- fundo para o final do buffer no nvimtree
          nvimtreeemptyfoldername = { fg = '#666666' }, -- nome de pastas vazias no nvimtree
          nvimtreeopenedfoldername = { fg = '#579fdc' }, -- nome de pastas abertas no nvimtree
          nvimtreefoldername = { fg = '#aaaaaa' }, -- nome de pastas no nvimtree

          winbarnc = { fg = '#202020', bg = '#202020' }, -- barra de janelas não ativa
          bufferlinefill = { bg = '#1a1a1a' }, -- cor de fundo do bufferline
          endofbuffer = { fg = '#202020', bg = 'none' }, -- garantindo que o final do buffer seja transparente
          underlined = { bg = nil }, -- sublinhado
        },
      }
      set_theme(default_theme)
    end,
  },
  {
    'catppuccin/nvim',
    config = function()
      require('catppuccin').setup {
        background = { light = 'latte', dark = 'mocha' },
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { 'italic' },
          functions = { 'bold' },
          keywords = { 'italic' },
        },
      }
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    config = function() end,
  },
  {
    'killitar/obscure.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() end,
  },
}
