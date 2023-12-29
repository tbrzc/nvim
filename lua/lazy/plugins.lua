local utils = require("utils")

local plugin = utils.setup_plugin
local theme = utils.setup_theme

local plugins = {
  --- theme ---
  {

    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = theme("c", "kanagawa")

  },


  {
    "dstein64/vim-startuptime"
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = plugin("d", "nvim-tree")
  },
  {
    "andrewferrier/wrapping.nvim",
    config = plugin("c", "wrapping", "misc")
  },
  {
    'mg979/vim-visual-multi'
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = plugin("c", "treesitter", "misc")

  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
      config = plugin("c", "telescope", "misc"),
    }
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
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
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
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      --"hrsh7th/cmp-git",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      --"windwp/nvim-autopairs",
    },
    config = plugin("c", "cmp", "lsp"),
  },
}
return plugins
