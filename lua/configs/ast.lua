local ast = {}

ast.treesitter = function()
    local treesitter = require("nvim-treesitter.configs")
    local utils = require("utils")
    treesitter.setup {
        ensure_installed = utils.parsers,
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
                    ['pi'] = '@parameter.inner',
                },
            },

        },
        autotag = {
            enable = true,
            filetypes = utils.filetypes,
            skip_tags = utils.skip_tags,
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<S-o>'] = '@parameter.inner',
            },
            swap_previous = {
                ['<S-n>'] = '@parameter.inner',
            },
        },

    }
end
return ast
