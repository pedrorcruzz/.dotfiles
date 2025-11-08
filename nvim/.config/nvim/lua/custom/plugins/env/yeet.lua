return {
  'samharju/yeet.nvim',
  dependencies = {
    'stevearc/dressing.nvim', -- optional, provides sane UX
  },
  version = '*', -- use the latest release, remove for master
  cmd = 'Yeet',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>kl',
      function()
        require('yeet').list_cmd()
      end,
      desc = 'Yeet: listar comandos',
    },
    {
      '<leader>ke',
      function()
        require('yeet').execute()
      end,
      desc = 'Yeet: executar comando',
    },
    {
      '<leader>kE',
      function()
        require('yeet').execute(nil, { clear_before_yeet = false, interrupt_before_yeet = true })
      end,
      desc = 'Yeet: executar sem limpar terminal',
    },
    {
      '<leader>kq',
      function()
        require('yeet').execute_selection { yeet_and_run = true, clear_before_yeet = false }
      end,
      mode = { 'v' },
      desc = 'Yeet: executar seleção',
    },
    {
      '<leader>ky',
      function()
        require('yeet').select_target()
      end,
      desc = 'Yeet: selecionar alvo',
    },
    {
      '<leader>ks',
      function()
        require('yeet').toggle_post_write()
      end,
      desc = 'Yeet: alternar execução pós-salvar',
    },
    {
      '<leader>ko',
      function()
        require('yeet').setqflist { open = true }
      end,
      desc = 'Yeet: enviar saída ao quickfix',
    },
  },
}
