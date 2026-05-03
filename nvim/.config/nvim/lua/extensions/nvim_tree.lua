local function open_win_config_func()
  local scr_w = vim.opt.columns:get()
  local scr_h = vim.opt.lines:get()
  local tree_w = 80
  local tree_h = math.floor(tree_w * scr_h / scr_w)
  return {
    border = "double",
    relative = "editor",
    width = tree_w,
    height = tree_h,
    col = (scr_w - tree_w) / 2,
    row = (scr_h - tree_h) / 2
  }
end

require("nvim-tree").setup {
  view = {
    signcolumn = "yes",
    float = {
      enable = true,
      open_win_config = open_win_config_func
    },
    cursorline = false
  },
  modified = {
    enable = true
  },
  renderer = {
    indent_width = 3,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
        hidden = false,
      },
      git_placement = "before", -- 揃っている方が見やすいという点からbeforeに設定
      glyphs = {
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          untracked = "★",
          renamed = "➜",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
  },
  hijack_cursor = true,
  sync_root_with_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true, -- ファイルを開いたら中央のツリーを閉じる（フローティング運用には特におすすめ）
    },
  },
}
