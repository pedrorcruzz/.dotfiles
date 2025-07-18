return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
  config = function()
    local devicons = require 'nvim-web-devicons'
    devicons.setup {
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
          icon = '',
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
        js = {
          icon = '',
          color = '#f7e018',
          cterm_color = '220',
          name = 'Js',
        },
        -- ts = {
        --   icon = '',
        --   color = '#3178c6',
        --   cterm_color = '74',
        --   name = 'Ts',
        -- },
      },
      override_by_filename = {
        ['go.mod'] = {
          icon = '󰟓',
          color = '#F471B5',
          cterm_color = '74',
          name = 'GoMod',
        },
        ['go.sum'] = {
          icon = '',
          color = '#F471B5',
          cterm_color = '74',
          name = 'GoSum',
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
      -- strict = true,
    }

    local original_get_icon = devicons.get_icon
    devicons.get_icon = function(name, ext, opts)
      if name and name:match '._test%.go$' then
        return '', 'GoTest'
      end
      if name and name:match '%.test%.js$' then
        return '', 'JsTest'
      end
      if name and name:match '%.test%.ts$' then
        return '', 'TsTest'
      end
      if name == 'next.config.ts' then
        return '', 'NextConfig'
      end
      if name == '.env.local' then
        return '', 'EnvLocal'
      end
      if name == '.env.local.example' then
        return '', 'EnvLocalExample'
      end
      return original_get_icon(name, ext, opts)
    end

    local original_get_icon_color = devicons.get_icon_color
    devicons.get_icon_color = function(name, ext, opts)
      if name and name:match '._test%.go$' then
        return '#02ADD8'
      end
      if name and name:match '%.test%.js$' then
        return '#f7e018'
      end
      if name and name:match '%.test%.ts$' then
        return '#3178c6'
      end
      if name == 'next.config.ts' then
        return '#3178c6'
      end
      if name == '.env.local' then
        return '#FCA5A5'
      end
      if name == '.env.local.example' then
        return '#FCA5A5'
      end
      return original_get_icon_color(name, ext, opts)
    end
  end,
}
