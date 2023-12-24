-----------------------------------------------------------
-- General Neovim settings and configuration
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua
-----------------------------------------------------------


-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g                -- Global variables
local opt = vim.opt            -- Set options (global/buffer/windows-scoped)
local options = {
    -----------------------------------------------------------
    -- See: https://neovim.io/doc/user/options.html
    -- General
    -----------------------------------------------------------
    mouse = "a",               -- Enable mouse support
    clipboard = "unnamedplus", -- Copy/paste to system clipboard
    swapfile = false,          -- Don't use swapfile
    fileencoding = "utf-8",
    -----------------------------------------------------------
    -- Neovim UI
    -----------------------------------------------------------
    number = true,             -- Show line number
    showmatch = true,          -- Highlight matching parenthesis
    foldmethod = "marker",     -- Enable folding (default 'foldmarker')
    colorcolumn = "80",        -- Line lenght marker at 80 columns
    splitright = true,         -- Vertical split to the right
    splitbelow = true,         -- Horizontal split to the bottom
    ignorecase = true,         -- Ignore case letters when search
    smartcase = true,          -- Ignore lowercase for the whole pattern
    linebreak = true,          -- Wrap on word boundary
    termguicolors = true,      -- Enable 24-bit RGB colors
    laststatus = 3,            -- Set global statusline
    cursorline = true,         -- Enable highlighting of the current line
    breakindent = true,
    relativenumber = true,
    textwidth = 80,
    wrapmargin = 2,
    -----------------------------------------------------------
    -- Editing
    -----------------------------------------------------------
    undofile = true,
    -----------------------------------------------------------
    -- Tabs, indent
    -----------------------------------------------------------
    expandtab = true,          -- Use spaces instead of tabs
    shiftwidth = 2,            -- Shift 2 spaces when tab
    tabstop = 2,               -- 1 tab == 2 spaces
    smartindent = true,        -- Autoindent new lines

    -----------------------------------------------------------
    -- Memory, CPU
    -----------------------------------------------------------
    hidden = true,             -- Enable background buffers
    history = 100,             -- Remember N lines in history
    lazyredraw = true,         -- Faster scrolling
    synmaxcol = 240,           -- Max column for syntax highlight
    updatetime = 250           -- ms to wait for trigger an event
}
local disabled_built_ins = {
   "2html_plugin",
   "tohtml",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "syntax",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
   "editorconfig"
}
-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
opt.shortmess:append "sI"
-- https://neovim.io/doc/user/pi_netrw.html
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-- Disable builtin plugins
for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
-- Load options
for k, v in pairs(options) do
    opt[k] = v
end


