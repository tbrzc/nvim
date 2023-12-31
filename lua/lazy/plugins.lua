local utils = require("utils")

local plugin = utils.setup_plugin
local theme = utils.setup_theme
local config = require("configs.ui")

local plugins = {
  --- theme ---
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "meuter/lualine-so-fancy.nvim",
    },
    opts = config.lualine

  },
  {

    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = theme("c", "vscode")

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
    event = "VeryLazy",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
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
      "hrsh7th/cmp-git",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
    },
    config = plugin("c", "cmp", "lsp"),
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = plugin("c", "ibl", "misc"),
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = plugin("c", "ufo", "misc"),
  },
  {
    "lewis6991/gitsigns.nvim",
    config = plugin("c", "gitsigns", "misc")
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git" }
  },
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    "Shatur/neovim-session-manager",
    config = plugin("c", "session_manager", "misc")
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
return plugins
