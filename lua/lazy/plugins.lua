local utils = require("utils")

local plugin = utils.setup_plugin
local theme = utils.setup_theme

local plugins = {
  --- theme ---

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
    },
    config = plugin("c", "treesitter", "misc")

  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    dependencies = { "rafamadriz/friendly-snippets" },

    config = plugin("c", "luasnip", "misc"),
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = plugin("c", "lspconfig", "lsp")
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' }
    },
  },
  --clean
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = plugin("c", "copilot", "misc")
  },
  {
    "zbirenbaum/copilot-cmp",
    config = plugin("d", "copilot_cmp"),

  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-git",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
    },
    config = plugin("c", "cmp", "lsp"),
  }



}
return plugins
