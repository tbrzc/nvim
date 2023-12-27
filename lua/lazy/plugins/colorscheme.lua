local utils = require('utils')
local theme = utils.setup_theme
return {

  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = theme("c", "kanagawa")

}
