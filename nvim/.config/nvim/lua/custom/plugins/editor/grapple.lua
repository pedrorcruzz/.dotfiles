return {

  'cbochs/grapple.nvim',
  opts = {
    scope = 'git', -- also try out "git_branch"
    icons = true, -- setting to "true" requires "nvim-web-devicons"
    status = true,
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    { '<leader>o1', '<cmd>Grapple select index=1<cr>', desc = 'Select first tag' },
    { '<leader>o2', '<cmd>Grapple select index=2<cr>', desc = 'Select second tag' },
    { '<leader>o3', '<cmd>Grapple select index=3<cr>', desc = 'Select third tag' },
    { '<leader>o4', '<cmd>Grapple select index=4<cr>', desc = 'Select fourth tag' },
    { '<leader>o5', '<cmd>Grapple select index=5<cr>', desc = 'Select fifth tag' },
    { '<leader>oo', '<cmd>Grapple toggle<cr>', desc = 'Grapple toggle tag' },
    { '<leader>oe', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
    { '<leader>of', '<cmd>Telescope grapple tags<cr>', desc = 'Grapple open tags window' },
    { '<leader>od', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle next tag' },
    { '<leader>oa', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
  },
}
