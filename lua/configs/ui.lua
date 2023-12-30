local ui = {}

ui.lualine = {

    options = {
        theme = "seoul256",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
            statusline = 100,
        },
    },
    sections = {
        lualine_a = {
            { "fancy_mode", width = 7 }
        },
        lualine_b = {
            { "fancy_branch" },

        },

        lualine_x = {
            { "fancy_macro" },
            { "fancy_diagnostics" },
            { "fancy_searchcount" },

        },
        lualine_y = {
            { "fancy_filetype", ts_icon = "" }
        },
        lualine_z = {
            { "fancy_lsp_servers" }
        },
    }

}



-- Add configurations for other plugins as needed

return ui
