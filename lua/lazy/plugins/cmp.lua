local plugin = {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', { 'windwp/nvim-autopairs', opts = {} },
        "rafamadriz/friendly-snippets", 'saadparwaiz1/cmp_luasnip',
    }
}
function plugin.config()
    local cmp = require 'cmp'
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local luasnip = require 'luasnip'
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup({})
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            -- ctrl + p
            -- ctrl + n
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },

        })
    })
    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')
    local servers = require("utils").servers
    for _, server in pairs(servers) do
        lspconfig[server].setup {
            capabilities = capabilities,
        }
    end
end

return plugin
