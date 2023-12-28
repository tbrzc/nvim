local lsp = {}









lsp.lspconfig = function()
    local lsp_zero = require('lsp-zero')
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local servers = require("utils").servers
    local server_configs = require("utils").server_configs

    lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- here you can configure the language servers

    mason.setup({
        ui = {
            border = "rounded"
        }
    })
    mason_lspconfig.setup({
        ensure_installed = servers,
        handlers = {
            lsp_zero.default_setup,
            server_configs,
        },
    })
end

lsp.cmp = function()
    local cmp = require 'cmp'
    local lspconfig = require('lspconfig')
    local servers = require("utils").servers
    local luasnip = require('luasnip')

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            --{ name = 'vsnip' },   -- For vsnip users.
            { name = 'luasnip' },
            { name = "path" }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
            { name = "copilot" },

            { name = 'buffer' },


        })
    })



    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
            { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })


    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

    for _, server in pairs(servers) do
        lspconfig[server].setup {
            capabilities = capabilities
        }
    end
end


return lsp
