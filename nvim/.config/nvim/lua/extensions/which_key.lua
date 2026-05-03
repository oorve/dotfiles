require('which-key').setup({
  preset = "modern", -- モダンなデザイン
  delay = function(ctx)
    return ctx.plugin and 0 or 300 -- プラグインのキーなら即表示、Leaderキー等は300ms待つ
  end,
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  win = {
    border = "single", -- 枠線を引く
    padding = { 1, 2 }, -- 内側の余白
  },
  layout = {
    align = "center", -- 中央揃え
  },
})
