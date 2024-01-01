local g = vim.g
local keymap = vim.keymap
local diagnostic = vim.diagnostic
local builtin = require('telescope.builtin')
local ufo = require('ufo')
g.mapleader = " "

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- Set leader key to space




-- General keymaps

map("i", "ii", "<ESC>")                 -- exit insert mode with ii
map("n", "<leader>wq", ":wq<CR>")       -- save and quit
map("n", "<leader>qq", ":q!<CR>")
map("n", "<leader>qa", ":quitall<CR>")  -- quit without saving
map("n", "<leader>ww", ":w<CR>")        -- save
map("n", "op", ":!open <c-r><c-a><CR>") -- open URL under cursor

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

keymap.set('n', '<leader>d', diagnostic.open_float)
keymap.set('n', '[d', diagnostic.goto_prev)
keymap.set('n', ']d', diagnostic.goto_next)
keymap.set('n', '<leader>dl', diagnostic.setloclist)


-- File tree

keymap.set('n', '<leader>tg', '<cmd>NvimTreeToggle<cr>')
--map('n', '<leader>sf', ':NvimTreeFindFile<CR>') -- search file


-- Telescope

keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})
--keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, {})
--keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
keymap.set('n', '<leader>fm', function() builtin.treesitter({ default_text = ":method:" }) end)

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
keymap.set('n', 'zR', ufo.openAllFolds)
keymap.set('n', 'zM', ufo.closeAllFolds)
