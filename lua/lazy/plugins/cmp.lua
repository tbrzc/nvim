return {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', { 'windwp/nvim-autopairs', opts = {} },
        "rafamadriz/friendly-snippets", 'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        local cmp = require 'cmp'
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local luasnip = require 'luasnip'
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup({})
        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                -- ctrl + p opcion previa
                -- ctrl + n siguiente opcion
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.

            })
        })
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        local lspconfig = require('lspconfig')
        local servers = require("utils").servers
        for _, server in pairs(servers) do
            lspconfig[server].setup {
                capabilities = capabilities,
            }
        end
    end


}
