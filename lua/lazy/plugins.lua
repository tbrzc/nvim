local utils = require("utils")

local plugin = utils.setup_plugin
local theme = utils.setup_theme

local plugins = {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag", },
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
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
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
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' }

}
return plugins
