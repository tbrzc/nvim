local misc = {}

misc.ibl = function()
  require("ibl").setup({
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
  })
end
return misc
