local utils = require("utils")
local map = utils.map
local g = vim.g
local keymap = vim.keymap
local diagnostic = vim.diagnostic
g.mapleader = " "

map("", "s", "j", {})
map("", "r", "k", {})
map("", "t", "l", {})
map("", "a", "h", {})

map("", "S", "5j", {})
map("", "R", "5k", {})

map("", "A", "0", {})
map("", "T", "$", {})

map("i", "ii", "<ESC>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>qq", ":q!<CR>")
map("n", "<leader>qa", ":quitall<CR>")
map("n", "<leader>ww", ":w<CR>")
map("n", "gx", ":!open <c-r><c-a><CR>")

map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")
map("n", "<leader>sx", ":close<CR>")
map("n", "<C-i>", "<C-w>-")
map("n", "<C-e>", "<C-w>+")
map("n", "<C-n>", "<C-w>>5")
map("n", "<C-o>", "<C-w><5>")

map('n', '<leader>ch', '<C-w>t<C-w>K')
map('n', '<leader>cv', '<C-w>t<C-w>H')

map('n', '<leader>n', '<C-w>h')
map('n', '<leader>i', '<C-w>j')
map('n', '<leader>e', '<C-w>k')
map('n', '<leader>o', '<C-w>l')

map("n", "<leader>to", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")
map("n", "<leader>tn", ":tabn<CR>")
map("n", "<leader>tp", ":tabp<CR>")

keymap.set('n', '<space>e', diagnostic.open_float)
keymap.set('n', '[d', diagnostic.goto_prev)
keymap.set('n', ']d', diagnostic.goto_next)
keymap.set('n', '<space>q', diagnostic.setloclist)

keymap.set('n', 'zR', require('ufo').openAllFolds)
keymap.set('n', 'zM', require('ufo').closeAllFolds)
