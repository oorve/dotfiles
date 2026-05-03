require('hlslens').setup({
  calm_down = true,
  nearest_only = true,
})

-- <leader>L: 検索結果を一覧（Quickfix）に変換し、画面のハイライトを掃除する
vim.keymap.set({'n', 'x'}, '<leader>L', function()
    vim.schedule(function()
        if require('hlslens').exportLastSearchToQuickfix() then
            vim.cmd('cw')
        end
    end)
    return ':noh<CR>'
end, {expr = true})

