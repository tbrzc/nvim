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
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },

  })
end

misc.luasnip = function()
  require("luasnip.loaders.from_vscode").lazy_load()
end

misc.wrapping = function()
  local wrapping = require("wrapping")
  local opts = { notify_on_switch = false }
  wrapping.setup({ opts })
  vim.cmd("SoftWrapMode")
end

misc.telescope = function()
  -- You dont need to set any of these options. These are the default ones. Only
  -- the loading is important
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  }
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')
end

misc.copilot = function()
  local copilot = require("copilot")
  copilot.setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
end


misc.ibl = function()
  local ibl = require("ibl")



  ibl.setup({
    indent = { char = "┆" },
  })
end



misc.ufo = function()
  local ufo = require("ufo")


  ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
      return { 'lsp', 'indent' }
    end
  })
end
misc.gitsigns = function()
  local gitsigns = require("gitsigns")
  gitsigns.setup {
    signs                        = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = true,  -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
      follow_files = true
    },
    attach_to_untracked          = true,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    yadm                         = {
      enable = false
    },
  }
end

misc.alpha = function()
  require 'alpha'.setup(require 'alpha.themes.dashboard'.onfig)
end

misc.auto_session = function()
  local auto_session = require('auto-session')
  auto_session.setup {
    log_level = 'info',
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },

  }
end

return misc
