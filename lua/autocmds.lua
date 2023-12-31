local api = vim.api

local config_group = api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

api.nvim_create_autocmd({ 'User' }, {
    pattern = "SessionLoadPost",
    group = config_group,
    callback = function()
        require('nvim-tree.api').tree.toggle(false, true)
    end,
})
