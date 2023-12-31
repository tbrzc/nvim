local configs = {}

configs.vscode = function()
  local vscode = require("vscode");
  local c = require('vscode.colors').get_colors()
  vscode.setup({
    disable_nvimtree_bg = true,
    -- Enable italic comment
    italic_comments = true,


  })

  -- setup must be called before loading
  require('vscode').load()
end
return configs
