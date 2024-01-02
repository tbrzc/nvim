local keymap = vim.keymap
local builtin = require('telescope.builtin')
local ufo = require('ufo')
local g = vim.g
g.mapleader = " "

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
