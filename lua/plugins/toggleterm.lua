return{
    -- amongst your other plugins
    'akinsho/toggleterm.nvim', version = "*", config = true,
    config = function()
        require('toggleterm').setup({
            open_mapping = '<C-g>',
            direction = 'float',
            shade_terminals = true
          })
      end,
    
  }