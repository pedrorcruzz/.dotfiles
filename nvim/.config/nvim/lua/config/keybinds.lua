vim.opt.hlsearch = true
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('x', '<C-j>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('x', '<C-k>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>', [[:m .+1<CR>==]], { noremap = true, silent = true })

-- Emmet
vim.g.user_emmet_leader_key = '<C-y>'

--Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vim.keymap.set('n', ';', '<Space>', { remap = true })
-- vim.keymap.set('v', ';', '<Space>', { remap = true })

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
