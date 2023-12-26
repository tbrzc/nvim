local lsp_zero = require('lsp-zero')
local handlers = vim.lsp.handlers
local lsp = vim.lsp


lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

local lua_opts = lsp_zero.nvim_lua_ls()
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup(lua_opts)
lspconfig.ast_grep.setup({
  capabilities = lsp_capabilities,
})
