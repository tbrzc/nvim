local plugin = {
    'brenoprata10/nvim-highlight-colors',
}

function plugin.config()
    require('nvim-highlight-colors').setup {}
end

return plugin
