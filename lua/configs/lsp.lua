local lsp = {}

lsp.lspconfig = function()
  local lsp_zero = require('lsp-zero')

  local mason = require('mason')
  local mason_lspconfig = require('mason-lspconfig')
  local servers = require("utils").servers
  lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
  end)
  mason.setup({
    ui = {
      border = "rounded"
    }
  })
  mason_lspconfig.setup({
    ensure_installed = servers,
    handlers = {
      lsp_zero.default_setup,
    }
  })
end






return lsp
