local theme = {
	"rebelot/kanagawa.nvim",
}
function theme.config()
	require('kanagawa').setup({
        compile = true,
        commentStyle = { italic = false },
        keywordStyle = { italic = false},
        transparent = false,
        dimInactive = true,
        terminalColors = true,
        background = {
            dark = "wave",
            light = "lotus"
        },
    })
    vim.cmd("colorscheme kanagawa-wave")
end
return theme
