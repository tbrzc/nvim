local utils = require("utils")

local plugin = utils.setup_plugin
local theme = utils.setup_theme

local plugins = {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = plugin("c", "treesitter", "ast")

  },
  {
    "rebelot/kanagawa.nvim",
    config = theme("d", "kanagawa-dragon")

  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = plugin("c", "nvim_cmp", "cmp")
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'williamboman/mason.nvim',
      "williamboman/mason-lspconfig.nvim",
    },
    config = plugin("c", "lspconfig", "lsp")
  },
  {
    'folke/neodev.nvim',
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = plugin("c", "ibl", "misc")
  },
}
return plugins
