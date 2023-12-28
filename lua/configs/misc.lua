local misc = {}
misc.treesitter = function()
    local nvim_treesitter = require("nvim-treesitter.configs")
    local parsers = require("utils").parsers

    nvim_treesitter.setup({
        ensure_installed = parsers,
        highlight = { enable = true }
    })
end




misc.wrapping = function()
    local wrapping = require("wrapping")
    local opts = { notify_on_switch = false }
    wrapping.setup({ opts })
    vim.cmd("SoftWrapMode")
end

misc.telescope = function()
    local telescope = require("telescope")
    telescope.load_extension('fzf')
    telescope.setup({})
end




misc.copilot = function()
    local copilot = require("copilot")
    copilot.setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
    })
end




return misc
