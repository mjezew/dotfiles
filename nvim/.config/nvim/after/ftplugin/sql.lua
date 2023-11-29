local keymap = vim.keymap

keymap.set('n', '<leader>r', ':normal vip<CR><PLUG>(DBUI_ExecuteQuery)', { buffer = true })
keymap.set('n', '<leader>w', '<PLUG>(DBUI_SaveQuery)', { buffer = true })
keymap.set('n', '<leader>F', ':%!sql-formatter-cli .<CR>', { buffer = true })
keymap.set('n', '<leader>f', ':normal vip<CR>:!sql-formatter-cli<CR>', { buffer = true })
