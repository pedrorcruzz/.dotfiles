return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
  config = function()
    require('nvim-web-devicons').setup {
      override = {
        zsh = {
          icon = '',
          color = '#428850',
          name = 'Zsh',
        },
        ['zshrc'] = {
          icon = '',
          color = '#428850',
          name = 'Zshrc',
        },
        go = {
          icon = '',
          color = '#00ADD8',
          cterm_color = '74',
          name = 'Go',
        },
        html = {
          icon = '',
          color = '#EA580B',
          cterm_color = '74',
          name = 'Html',
        },
        css = {
          icon = '',
          color = '#c18efe',
          cterm_color = '74',
          name = 'Css',
        },
      },
      override_by_filename = {
        ['go.mod'] = {
          icon = '',
          color = '#F471B5',
          cterm_color = '74',
          name = 'GoMod',
        },
        ['go.sum'] = {
          icon = '',
          color = '#F471B5',
          cterm_color = '74',
          name = 'GoSum',
        },
        ['go-test'] = {
          icon = '',
          color = '#606060',
          cterm_color = '74',
          name = 'GoTest',
        },
        ['README.md'] = {
          icon = '',
          color = '#ffffff',
          cterm_color = '74',
          name = 'Readme',
        },
        ['Makefile'] = {
          icon = '',
          color = '#F471B5',
          cterm_color = '74',
          name = 'Makefile',
        },
        ['package-lock.json'] = {
          icon = '',
          color = '#2DD4BF',
          cterm_color = '74',
          name = 'PackageLock',
        },
        ['package.json'] = {
          icon = '',
          color = '#2DD4BF',
          cterm_color = '74',
          name = 'PackageJson',
        },
        ['.gitignore'] = {
          icon = '',
          color = '#F87171',
          cterm_color = '74',
          name = 'Gitignore',
        },
      },
    }
  end,
}
