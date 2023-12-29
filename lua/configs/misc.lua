local misc = {}
misc.treesitter = function()
    local nvim_treesitter = require("nvim-treesitter.configs")
    local parsers = require("utils").parsers

    nvim_treesitter.setup({
        ensure_installed = parsers,
        highlight = { enable = true }
    })
end

misc.luasnip = function()
    require("luasnip.loaders.from_vscode").lazy_load()
end



misc.wrapping = function()
    local wrapping = require("wrapping")
    local opts = { notify_on_switch = false }
    wrapping.setup({ opts })
    vim.cmd("SoftWrapMode")
end

misc.telescope = function()
    -- You dont need to set any of these options. These are the default ones. Only
    -- the loading is important
    require('telescope').setup {
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
end




misc.copilot = function()
    local copilot = require("copilot")
    copilot.setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
    })
end




return misc
