local telescope = require 'telescope'
local themes = require 'telescope.themes'

telescope.setup {
  defaults = {
    preview = {
      treesitter = false,
    },
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
        ['<esc>'] = require('telescope.actions').close,
        ['<C-[>'] = require('telescope.actions').close,
      },
      n = {
        ['<C-h>'] = 'which_key',
      }
    },
    winblend = 20,
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}
telescope.load_extension 'fzf'

local builtin = require 'telescope.builtin'


