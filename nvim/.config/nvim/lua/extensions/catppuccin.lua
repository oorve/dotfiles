require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = true, -- ターミナルの背景透過を維持
  show_end_of_buffer = false,
  integration_default = false,
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    telescope = {
      enabled = true,
    },
    nvimtree = true,
    lualine = true,
    gitsigns = true,
    scrollbar = true,
  },
})

-- テーマを反映
vim.cmd.colorscheme "catppuccin"
