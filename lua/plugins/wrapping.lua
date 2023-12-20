return {
    "andrewferrier/wrapping.nvim",
    config = function()
        require("wrapping").setup()
        vim.cmd 'SoftWrapMode'
    end,
}
