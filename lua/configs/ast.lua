local ast = {}

ast.treesitter = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup {
        ensure_installed = require("utils").parsers,
        highlight = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
        refactor = {
            highlight_definitions = {
                enable = true,
                clear_on_cursor_move = true,
            },
            highlight_current_scope = { enable = true },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = ";", --grr
                },
            },

        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["fo"] = "@function.outer",
                    ["fi"] = "@function.inner",
                    ["co"] = "@conditional.outer",
                    ["ci"] = "@conditional.inner",
                    ["po"] = "@parameter.outer",
                    ["pi"] = "@parameter.inner",
                    ["lo"] = "@loop.outer",
                    ["li"] = "@loop.inner",

                },
            },
        },
        treesittercontext = {
            enable = true,
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
            },
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-z>',
                node_incremental = '<c-z>',
                node_decremental = '<c-x>',
            },
        },
    }
end
return ast
