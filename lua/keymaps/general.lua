local utils = require("utils")
local map = utils.map
local g = vim.g
g.mapleader = " "

-- Vim for Colemak
map("", "s", "j", {})
map("", "r", "k", {})
map("", "t", "l", {})
map("", "a", "h", {})


map("", "S", "5j", {})
map("", "R", "5k", {})

map("", "A", "0", {})
map("", "T", "$", {})

-- General keymaps

map("i", "ii", "<ESC>")                         -- exit insert mode with ii
map("n", "<leader>wq", ":wq<CR>")               -- save and quit
map("n", "<leader>qq", ":q!<CR>")
map("n", "<leader>qa", ":quitall<CR>")          -- quit without saving
map("n", "<leader>ww", ":w<CR>")                -- save
map("n", "<leader>op", ":!open <c-r><c-a><CR>") -- open URL under cursor





-- Split window management

map("n", "<leader>sv", "<C-w>v")       -- split window vertically
map("n", "<leader>sh", "<C-w>s")       -- split window horizontally

map("n", "<leader>sx", ":close<CR>")   -- close split window

map("n", "<C-i>", "<C-w>-")            -- make split window height shorter-
map("n", "<C-e>", "<C-w>+")            -- make split windows height taller
map("n", "<C-n>", "<C-w>>5")           -- make split windows width bigger
map("n", "<C-o>", "<C-w><5")           -- make split windows width smaller
-- Change split orientation
map('n', '<leader>ch', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>cv', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<leader>n', '<C-w>h')
map('n', '<leader>i', '<C-w>j')
map('n', '<leader>e', '<C-w>k')
map('n', '<leader>o', '<C-w>l')
-- Tab management

map("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
map("n", "<leader>tx", ":tabclose<CR>") -- close a tab
map("n", "<leader>tn", ":tabn<CR>")     -- next tab
map("n", "<leader>tp", ":tabp<CR>")     -- previous tab
