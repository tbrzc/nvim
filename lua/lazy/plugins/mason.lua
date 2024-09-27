-- useful commands:
-- :checkhealth mason
local plugin = {
	"williamboman/mason.nvim"
}
function plugin.config()
	require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
end

return plugin
