-- DOCS:
-- https://neovim.io/doc/user/options.html
-- https://neovim.io/doc/user/vim_diff.html
--   [2] Defaults - *nvim-defaults*



local g             = vim.g
local opt           = vim.opt
local options       = {
  -- UI
  background = 'dark',
  number = true,
  laststatus = 3,
  termguicolors = true,
  showmatch = true,
  cursorline = true,
  cursorlineopt = "number",
  -- CPU
  hidden = true,
  history = 100,
  synmaxcol = 240,
  updatetime = 250,
  swapfile = false,
  -- INDENT
  shiftwidth = 2,
  tabstop = 2,
  smartindent = true,
  breakindent = true,
  expandtab = true,
  -- EDITOR
  splitright = true,
  splitbelow = true,
  relativenumber = true,
  clipboard = "unnamed,unnamedplus",
  completeopt = "menu,menuone,noselect",
  mouse = "a",
  undofile = true,
  ignorecase = true,
  smartcase = true,
  fileencoding = "utf-8",
  -- FOLDING
  foldcolumn = '0',
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
}
local builtin_plugs = {
  "2html_plugin",
  "tohtml",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  --https://neovim.io/doc/user/pi_netrw.html
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
-- Desactiva la intro
opt.shortmess:append "sI"
for _, plugin in ipairs(builtin_plugs) do
  g["loaded_" .. plugin] = 1
end
for k, v in pairs(options) do
  opt[k] = v
end
