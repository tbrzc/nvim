--https://vonheikemen.github.io/devlog/es/tools/neovim-plugins-to-get-started/
--https://github.com/the-alpha-developer/mastering-neovim/blob/main/lua/plugins/tree-sitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = "VeryLazy",
    main  = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "lua",
        "luadoc",
        'javascript',
    'typescript',
    'html',
    'css',
    'scss',
    'php',
    'json',
    
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            --['ac'] = '@class.outer',
            --['ic'] = '@class.inner',
          }
        }
      },
    },
  }