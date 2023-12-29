local g = vim.g
local keymap = vim.keymap
local diagnostic = vim.diagnostic
local builtin = require('telescope.builtin')
local ufo = require('ufo')

-- Set leader key to space

g.mapleader = " "

-- General keymaps

keymap.set("i", "ii", "<ESC>")
keymap.set("i", "vv", "<ESC>:visual<CR>")      -- exit insert mode with ii
keymap.set("n", "<leader>wq", ":wq<CR>")       -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>")       -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>")        -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- Split window management

keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-")     -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+")     -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5")    -- make split windows width bigger
keymap.set("n", "<leader>sh", "<C-w><5")    -- make split windows width smaller

-- Tab management

keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

keymap.set('n', '<leader>e', diagnostic.open_float)
keymap.set('n', '[d', diagnostic.goto_prev)
keymap.set('n', ']d', diagnostic.goto_next)
keymap.set('n', '<leader>q', diagnostic.setloclist)


-- File tree

keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>')

-- Telescope

keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})
keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, {})
keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
keymap.set('n', '<leader>fm', function() builtin.treesitter({ default_text = ":method:" }) end)

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
keymap.set('n', 'zR', ufo.openAllFolds)
keymap.set('n', 'zM', ufo.closeAllFolds)
