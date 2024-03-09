-- DOCS:
-- https://neovim.io/doc/user/options.html
-- https://neovim.io/doc/user/vim_diff.html
--   [2] Defaults - *nvim-defaults*
vim.cmd("colorscheme habamax")
local opt = vim.opt
local options = {
	background     = dark,
	number         = true,
	showmatch      = true,
	cursorline     = true,
	cursorlineopt  = "number",
	-----------------------------------------------------------
	-- Tabs, indent
	-----------------------------------------------------------
	shiftwidth     = 4, -- the number of spaces inserted for each indentation
	tabstop        = 4, -- insert 2 spaces for a tab
	expandtab      = true, -- Use spaces instead of tabs

	splitright     = true,
	splitbelow     = true,
	relativenumber = true,
	clipboard      = "unnamedplus",
	mouse          = "a",
	undofile       = true,
	ignorecase     = true, -- All your searches will be case insensitive
	smartcase      = true, -- Your search will be case sensitive if it contains an uppercase letter
	swapfile       = false,
	termguicolors  = true,
}
opt.shortmess:append "sI"
for k, v in pairs(options) do
	opt[k] = v
end
