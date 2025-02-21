-- Mapeamentos de teclas
vim.opt.hlsearch = true
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('x', '<C-o>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('x', '<C-p>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>', [[:m .+1<CR>==]], { noremap = true, silent = true })
