local opts = {
	indent = {
		char = "│",
		tab_char = "│",
	},
	exclude = {
		filetypes = {
			"help",
			"lazy",
		},
	},
	scope = { enabled = false },
}
local plugin = {
	"lukas-reineke/indent-blankline.nvim",
	opts = opts,
	main = "ibl",
}

return plugin
