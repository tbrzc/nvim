local utils = require("utils")

local plugin = utils.setup_plugin
local theme = utils.setup_theme

local plugins = {


  {

    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = theme("c", "kanagawa")

  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },
    config = plugin("c", "treesitter", "ast")

  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },

  {
    'neovim/nvim-lspconfig',
    -- dependencies = {
    --   { 'hrsh7th/cmp-nvim-lsp' },
    -- },
    config = plugin("c", "lspconfig", "lsp")
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },



}
return plugins
