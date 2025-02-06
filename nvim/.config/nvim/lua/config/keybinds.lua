-- Mapeamentos de teclas
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('x', '<C-k>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('x', '<C-j>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('n', '<S-A-x>', ':BufDel *<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<space>v', 'g<C-G>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>', [[:m .+1<CR>==]], { noremap = true, silent = true })

-- Divisões de janelas
-- vim.keymap.set('n', '<S-q>', ':vsplit<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<S-n>', ':split<CR>', { noremap = true, silent = true })

-- Configuração do Emmet
-- vim.g.user_emmet_leader_key = '<C-y>'


-- Comando para FineCmdline
-- vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true, silent = true })
