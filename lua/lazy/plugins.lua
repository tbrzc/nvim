local utils = require("utils")

local plugin = utils.setup_plugin
local theme = utils.setup_theme

local plugins = {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    config = plugin("c", "treesitter", "ast")

  },
  {

    "rebelot/kanagawa.nvim",
    config = theme("c", "kanagawa")

  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
}
return plugins
