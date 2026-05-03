-- =============================================================================
-- 【全キーバインド管理台帳】
-- このファイルは、すべての操作の「説明書」を兼ねています。
-- 実際の設定が別ファイルにある場合も、ここにすべて記載しています。
-- =============================================================================

-- Leaderキー (特等席のキー) の設定
-- 由来: 複数のキーを組み合わせる際の起点となるキー。指の届きやすさから "," (カンマ) に設定。
vim.g.mapleader = ','

-- -----------------------------------------------------------------------------
-- 1. 基本操作 (Standard Operations)
-- -----------------------------------------------------------------------------

-- セミコロンとコロンの入れ替え (指の負担を減らすため)
-- ";" でコマンドラインモードに入り、":" で次の ";" への移動（本来の動作）を行う
-- (由来: コマンド入力 ":" は頻繁に使うが、Shiftキーが必要で指が疲れるため入れ替え)
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

-- -----------------------------------------------------------------------------
-- 2. ウィンドウ・バッファ操作 (Navigation)
-- -----------------------------------------------------------------------------

-- ウィンドウ間の移動 (Ctrl + h/j/k/l)
-- 各方向（左/下/上/右）へ瞬時にフォーカスを移動する
-- (由来: ホームポジションを維持したまま、Vimの移動キー hjkl で窓を飛び移る)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "左のウィンドウへ移動" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "下のウィンドウへ移動" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "上のウィンドウへ移動" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "右のウィンドウへ移動" })

-- バッファ（開いているファイル）の切り替え (Tab / Shift + Tab)
-- 画面上部のタブ（lualine）に並んでいるファイルを次々に切り替える
-- (由来: ブラウザのタブ切り替えと同じ感覚でファイルを巡回する)
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = "次のバッファ" })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { desc = "前のバッファ" })

-- -----------------------------------------------------------------------------
-- 3. プラグイン操作 (Extensions)
-- =============================================================================

-- [Telescope] ファイル・文字のあいまい検索
-- -----------------------------------------------------------------------------

-- ",ff" (Find Files): プロジェクト内のファイルを名前で検索
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = "ファイルを検索" })

-- ",fg" (Live Grep): プロジェクト内の全ファイルからテキストを全文検索
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = "全文検索 (Grep)" })

-- ",fG" (Find hidden): 隠しファイル(.config等)を含む全文検索
vim.keymap.set('n', '<leader>fG', function()
  require('telescope.builtin').live_grep({ additional_args = { '--hidden' } })
end, { desc = "全文検索 (隠しファイル含む)" })

-- ",fb" (Find Buffers): 今開いているファイルの一覧を表示して切り替え
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = "開いているバッファを検索" })

-- ",fh" (Find Help): Vimのヘルプドキュメントから検索
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = "ヘルプを検索" })

-- ",?" (WhichKey): すべてのキーバインドを一覧表示
vim.keymap.set('n', '<leader>?', '<cmd>WhichKey<CR>', { desc = "すべてのキーバインドを表示" })

-- [Nvim-Tree] ファイルエクスプローラー
-- -----------------------------------------------------------------------------

-- ",n" (NvimTree): 中央に浮遊するエクスプローラーを開閉
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { desc = "ファイルツリー開閉" })

-- =============================================================================
-- 【他ファイルで定義されているキー】
-- ※ 以下の項目はプラグイン個別の設定ファイルで定義されているため、
--    ここでは「説明用」としてコメントアウト形式で記載しています。
-- =============================================================================

-- [nvim-treesitter] 高度な範囲選択
-- (実体: extensions/treesitter.lua)
-- -----------------------------------------------------------------------------
-- [[
-- "gnn" (Grab-Next-Node): 構文に基づいた「意味の塊」としての選択を開始
-- (由来: g は拡張プレフィックス、Grab(掴む) または Go(行く) で選択を開始する)
-- vim.keymap.set('n', 'gnn', 'incremental_selection.init')

-- "grn" (Go-Range-Next): 選択範囲を「一回り大きな塊（関数全体など）」に広げる
-- (由来: Grab中の Range(範囲) を Next(次) の階層へ広げる)
-- vim.keymap.set('n', 'grn', 'incremental_selection.node_incremental')

-- "grm" (Go-Range-Minus): 選択範囲を「一回り小さな塊」に戻す
-- (由来: Range(範囲) を Minus(マイナス) 方向に縮める)
-- vim.keymap.set('n', 'grm', 'incremental_selection.node_decremental')

-- "grc" (Go-Range-Container): スコープ（{}の中身など）単位で選択範囲を広げる
-- (由来: Range(範囲) を Container(器) 単位で広げる)
-- vim.keymap.set('n', 'grc', 'incremental_selection.scope_incremental')
-- ]]

-- [hlslens] 検索の高度化（レンズ表示とリスト化）
-- (実体: extensions/hlslens.lua)
-- -----------------------------------------------------------------------------
-- [[
-- "n" (next): 次の検索ヒット箇所へ移動（画面横に [1/10] などのカウント表示が出る）
-- vim.keymap.set('n', 'n', 'hlslens.n')

-- "N" (Next-Reverse): 前の検索ヒット箇所へ移動
-- vim.keymap.set('n', 'N', 'hlslens.N')

-- ",L" (List): 今の検索結果（ピカピカ）を一覧表に出し、画面を掃除する
-- (由来: 検索結果を "L"ist 一覧にして整理し、探索フェーズを終了する)
-- vim.keymap.set({'n', 'x'}, '<leader>L', 'hlslens.exportLastSearchToQuickfix')
-- ]]

-- [gitsigns] Git連携（左端へのサイン表示と差分操作）
-- (実体: extensions/gitsigns.lua)
-- -----------------------------------------------------------------------------
-- [[
-- "]c" (Next-Change): 次のGit変更箇所（ハンク）へジャンプ
-- (由来: Vimの伝統 ] = 次へ、Change(変更) の c を組み合わせてワープする)
-- vim.keymap.set('n', ']c', 'gitsigns.next_hunk()')

-- "[c" (Prev-Change): 前のGit変更箇所（ハンク）へジャンプ
-- (由来: Vimの伝統 [ = 前へ、Change(変更) の c を組み合わせてワープする)
-- vim.keymap.set('n', '[c', 'gitsigns.prev_hunk()')

-- ",hp" (Hunk-Preview): 保存される前の状態を小さな窓で覗き見る
-- (由来: 変更の塊 Hunk(ハンク) を Preview(下見) する)
-- vim.keymap.set('n', '<leader>hp', 'gitsigns.preview_hunk()')

-- ",hr" (Hunk-Reset): 今いる箇所の変更を元に戻す
-- (由来: 編集に失敗したとき、その Hunk(ハンク) だけを Reset(やり直し) する)
-- vim.keymap.set('n', '<leader>hr', 'gitsigns.reset_hunk()')

-- ",hs" (Hunk-Stage): 今いる箇所の変更をコミット待ち状態にする
-- (由来: Hunk(ハンク) を Gitの Stage(保存準備) に送る)
-- vim.keymap.set('n', '<leader>hs', 'gitsigns.stage_hunk()')

-- ",hb" (Hunk-Blame): この行を最後に書いたのが誰かを表示する
-- (由来: 変更の責任者(Blame = 誰のせいだ)を特定する Git用語)
-- vim.keymap.set('n', '<leader>hb', 'gitsigns.blame_line()')

-- ",hd" (Hunk-Diff): 変更前と変更後の差分を画面2分割で比較する
-- (由来: Hunk(ハンク) の Diff(差分) を詳細に確認する)
-- vim.keymap.set('n', '<leader>hd', 'gitsigns.diffthis()')

-- ",tb" (Toggle-Blame): 行末の履歴表示（Blame）のオンオフを切り替える
-- (由来: 常に表示されていると邪魔な履歴を Toggle(切り替え) する)
-- vim.keymap.set('n', '<leader>tb', 'gitsigns.toggle_current_line_blame()')
-- ]]
