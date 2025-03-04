vim.opt.hlsearch = true
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('x', '<C-j>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('x', '<C-k>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>', [[:m .+1<CR>==]], { noremap = true, silent = true })
