--https://github.com/yujiqo/nvim
local utils = {}

utils.filetypes = {
  'html', 'javascript', 'typescript', 'svelte',
  'php',
}
utils.skip_tags = {
  'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
  'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr', 'menuitem'
}



utils.parsers = {
  "css",
  "gitignore",
  "html",
  "javascript",
  "lua",
  "luadoc",
  "vim",
  "vimdoc",
  "scss",
  "typescript",
  "json",
  "svelte",
  "jsdoc",
}

utils.servers = {
  "html",
  "lua_ls",
  "tsserver",
  "tailwindcss",
  "cssls",
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

utils.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
return utils
