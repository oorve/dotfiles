-- Catppuccin の色パレットを取得（mochaフレーバー用）
local colors = require("catppuccin.palettes").get_palette("mocha")

-- バッファ（上部のタブ）の色設定：Catppuccinの色で再現
local switch_color = {
  active = { fg = colors.base, bg = colors.pink },      -- 選択中：背景をピンクに
  inactive = { fg = colors.text, bg = colors.surface0 }, -- 非選択：背景を暗く
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto", -- Catppuccin のテーマを自動適用
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true, -- バーを一本にまとめてスッキリさせる
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "filename",
        file_status = true,
        path = 1, -- 親フォルダのパスまで表示
        symbols = { modified = " ●", readonly = " ", newfile = "󰄛", unnamed = "[No Name]" },
      },
      "branch",
    },
    lualine_c = {
      {
        "diagnostics",
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
    lualine_x = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = colors.peach }, -- 更新通知の色
      },
      "encoding",
      {
        "fileformat",
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        }
      },
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        show_filename_only = true,
        show_modified_status = true,
        mode = 0,
        buffers_color = switch_color, -- バッファの色を Catppuccin 流に
        symbols = { modified = " ●", alternate_file = " ", directory = " " },
      },
    },
    lualine_z = { "tabs" },
  },
})