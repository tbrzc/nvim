local plugin = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'neovim/nvim-lspconfig' },
    }
}
function plugin.config()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require('mason').setup({
        ui = {
            border = "rounded"
        }
    })
    require('mason-lspconfig').setup({
        ensure_installed = require('utils').servers,
        handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
                local lua_opts = lsp_zero.nvim_lua_ls()
                require('lspconfig').lua_ls.setup(lua_opts)
            end,
        }
    })
end

return plugin
