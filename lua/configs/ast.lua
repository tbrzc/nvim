local ast = {}
--inspectree
ast.treesitter = function()
  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup {
    ensure_installed = require("utils").parsers,
    ignore_install = {},
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024         -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    }
  }
end
return ast
