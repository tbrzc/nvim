local misc = {}

misc.treesitter = function()
  local nvim_treesitter = require("nvim-treesitter.configs")
  local parsers = require("utils").parsers

  nvim_treesitter.setup({
    ensure_installed = parsers,
    highlight = { enable = true },
    indent = {
      enable = true,
    },
  })
end

misc.luasnip = function()
  require("luasnip.loaders.from_vscode").lazy_load()
end

misc.copilot = function()
  local copilot = require("copilot")
  copilot.setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
end




return misc
