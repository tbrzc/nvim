local theme = {
	"rebelot/kanagawa.nvim",
}
function theme.config()
	require('kanagawa').setup({
        compile = true,
        keywordStyle = { italic = false},
        dimInactive = true,
        background = {
            dark = "wave",
            light = "lotus"
        },
    })
    vim.cmd("colorscheme kanagawa-wave")
end
return theme
