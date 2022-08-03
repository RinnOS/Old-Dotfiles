local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap

map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--  normal_mode = 'n',
--  insert_mode = 'i',
--  visual_mode = 'v',
--  visual_block_mode = 'x',
--  term_mode = 't',
--  command_mode = 'c'

-- Normal --
-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-Up>', '<C-w>k', opts)
map('n', '<C-Down>', '<C-w>j', opts)
map('n', '<C-Left>', '<C-w>h', opts)
map('n', '<C-Right>', '<C-w>l', opts)

map('n', '<leader>wh', '<C-w>h', opts)
map('n', '<leader>wj', '<C-w>j', opts)
map('n', '<leader>wk', '<C-w>k', opts)
map('n', '<leader>wl', '<C-w>l', opts)
map('n', '<leader>w<Left>', '<C-w>h', opts)
map('n', '<leader>w<Down>', '<C-w>j', opts)
map('n', '<leader>w<Up>', '<C-w>k', opts)
map('n', '<leader>w<Right>', '<C-w>l', opts)

-- Resize
map('n', '<C-S-Up>', ':resize +2<CR>', opts)
map('n', '<C-S-Down>', ':resize -2<CR>', opts)
map('n', '<C-S-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-S-Right>', ':vertical resize +2<CR>', opts)
map('n', '<C-S-k>', ':resize +2<CR>', opts)
map('n', '<C-S-j>', ':resize -2<CR>', opts)
map('n', '<C-S-h>', ':vertical resize -2<CR>', opts)
map('n', '<C-S-l>', ':vertical resize +2<CR>', opts)

-- Splits
map('n', '<leader>ws', ':split<CR>', opts)
map('n', '<leader>wv', ':split<CR>', opts)

map('n', '<leader>e', ':Lex 20<CR>', opts)

-- Insert --
-- jk fast to exit
map('i', 'jk', '<ESC>', opts)

-- Visual --
-- Indent
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move text up and down
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)
map('v', '<A-Down>', ':m .+1<CR>==', opts)
map('v', '<A-Up>', ':m .-2<CR>==', opts)

map('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
map('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
map('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)
map('x', '<A-Down>', ":move '>+1<CR>gv-gv", opts)
map('x', '<A-Up>', ":move '<-2<CR>gv-gv", opts)
