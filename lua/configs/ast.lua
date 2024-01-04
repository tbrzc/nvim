local ast = {}
--inspectree
ast.treesitter = function()
  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup {
    ensure_installed = require("utils").parsers,
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    autotag = {
      enable = true,
    }
  }
end
return ast
