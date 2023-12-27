local opts = { notify_on_switch = false }
return {
    {
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup(opts)
            vim.cmd("SoftWrapMode")
        end,
    }
}
