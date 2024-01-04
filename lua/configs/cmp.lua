local autocomplete = {}
local cmp = require("cmp")
--inspectree
autocomplete.nvim_cmp = function()
  cmp.setup {
    mapping = {
      ['<C-p>'] = cmp.mapping.scroll_docs(-4),
      ['<C-n>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
      ["<C-c>"] = cmp.mapping.complete(),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'cmdline' },
    },
    {{ name = 'buffer' },}
  }

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end
return autocomplete
