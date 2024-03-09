local plugin = {
  'andrewferrier/wrapping.nvim',
}

local opts = {
  notify_on_switch = false
}

function plugin.config()
  require('wrapping').setup(opts)
  vim.cmd('SoftWrapMode')
end

return plugin
