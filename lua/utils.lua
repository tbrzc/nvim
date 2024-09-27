local utils = {
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
		--always install these
		"lua_ls",
		"vimls",
		-- html, templ, css, scss, less
		"html",
		"cssls",
		-- js,
		"quick_lint_js", --linter
		"harper_ls" -- English grammar checker
	}
}

return utils
