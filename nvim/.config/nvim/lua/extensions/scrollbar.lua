-- Catppuccin の色パレットを取得（mochaフレーバー用）
local colors = require("catppuccin.palettes").get_palette("mocha")

require("scrollbar").setup({
  handle = {
    color = colors.surface2, -- スクロールバーのツマミの色
  },
  marks = {
    Search = { color = colors.peach },    -- 検索ヒット箇所の印
    Error  = { color = colors.red },      -- エラー箇所の印
    Warn   = { color = colors.yellow },   -- 警告箇所の印
    Info   = { color = colors.sky },      -- 情報箇所の印
    Hint   = { color = colors.teal },     -- ヒント箇所の印
    Misc   = { color = colors.mauve },    -- その他
  },
})

-- Git連携：Gitの変更箇所（追加・削除など）をバー上に表示する
require("scrollbar.handlers.gitsigns").setup()
