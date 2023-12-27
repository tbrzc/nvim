--https://vonheikemen.github.io/devlog/es/tools/neovim-plugins-to-get-started/
--https://github.com/the-alpha-developer/mastering-neovim/blob/main/lua/plugins/tree-sitter.lua
local parsers = require("utils").parsers
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  main  = "nvim-treesitter.configs",
  opts  = {
    ensure_installed = parsers,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
