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

mason.setup({})
mason_lspconfig.setup({
  ensure_installed = servers,
  handlers = {
    lsp_zero.default_setup,
    server_configs,
  },
})
