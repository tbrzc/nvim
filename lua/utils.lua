local utils = {}


utils.parsers = {
    "bash", "c", "cpp", "cmake", "css",
    "gitignore", "html",
    "javascript", "lua", "make", "scss", "sql",
    "typescript",
}

utils.servers = {
    "html", "lua_ls", "tsserver", "tailwindcss", "cssls", "ast_grep"
}

utils.server_configs = {
    lua_ls = function()
        return {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            vim.env.VIMRUNTIME,
                        }
                    }
                }
            }
        }
    end,

}


utils.setup_theme = function(setup_type, setup_name)
    if setup_type == "d" then
        return load(('vim.cmd[[colorscheme %s]]'):format(setup_name))
    elseif setup_type == "c" then
        return load(('require("configs.theme").%s()'):format(setup_name))
    end
end


utils.setup_plugin = function(setup_type, setup_name, plugin_category)
    if setup_type == "d" then
        return load(('require("%s").setup()'):format(setup_name))
    elseif setup_type == "c" and plugin_category then
        return load(('require("configs.%s").%s()'):format(plugin_category, setup_name))
    end
end
return utils
