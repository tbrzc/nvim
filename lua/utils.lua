return {
	parsers = {
		--always install these
		"lua",
		"vim",
		"vimdoc",
		-- install there what you need
		"css",
		"scss",
		"html",
		"javascript",
		"typescript"
	},
	servers = {
		"html",
		"lua_ls",
		"cssls",
		"tsserver",
		"vimls",
		"clangd"
	}
}
