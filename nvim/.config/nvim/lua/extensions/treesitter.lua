-- nvim-treesitter v1.0 API
require("nvim-treesitter").setup()

-- ファイルを開いたときにtreesitterハイライトを有効化
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if not ok then
      -- パーサーが未インストールの場合はインストール
      local lang = vim.treesitter.language.get_lang(args.match)
      if lang then
        pcall(require("nvim-treesitter.install").install, lang)
      end
    end
  end,
})
