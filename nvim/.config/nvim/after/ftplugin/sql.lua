local keymap = vim.keymap

keymap.set('n', '<leader>r', ':normal vip<CR><PLUG>(DBUI_ExecuteQuery)', { buffer = true })
keymap.set('n', '<leader>w', '<PLUG>(DBUI_SaveQuery)', { buffer = true })
