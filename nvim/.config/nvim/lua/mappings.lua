local map = vim.api.nvim_set_keymap
local default_options = {noremap = true}
vim.g.mapleader = " "
map("n", ";", ":", default_options)
map("v", ";", ":", default_options)
map("n", ":", ";", default_options)
map("v", ":", ";", default_options)

map("n", "<up>", ":copen<cr>", default_options) 
map("n", "<down>", ":cclose<cr>", default_options) 
map("n", "<left>", ":cprev<cr>", default_options) 
map("n", "<right>", ":cnext<cr>", default_options) 

map("n", "<leader>/", ":silent grep -i ", default_options)
map("n", "<leader>lh", ":lua vim.lsp.buf.hover()<cr>", default_options)
map("n", "<leader>ld", ":lua vim.lsp.buf.definition()<cr>", default_options)
map('n', '<leader>lo', ':lua require("telescope.builtin").lsp_document_symbols()<cr>', default_options)
map('n', '<leader>fi', '<CMD>Telescope symbols<CR>', default_options)
-- map('n', '<leader>lO', ':lua vim.lsp.buf.document_symbol()<cr>', default_options)
map("n", "<leader>ls", ":lua require('telescope.builtin').live_grep()<cr>", default_options)
map("n", "<leader>p", "<cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_options)
map("n", "<leader>po", "<cmd>lua require('telescope.builtin').resume()<cr>", default_options)
map("n", "<leader>ba", "<cmd>lua require('telescope.builtin').buffers({ show_all_buffers = true })<cr>", default_options)
map('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.git_status()<cr>", default_options)
map("n", "<leader>,", ":nohlsearch<cr>", default_options)  
map("n", "n", "nzz", default_options)
map("n", "N", "Nzz", default_options)

map('n', '<leader>tt', ':TestFile<CR>', default_options)
map('n', '<leader>tT', ':TestFile -strategy=vimux<CR>', default_options)
map('n', '<leader>tn', ':TestNearest<CR>', default_options)
map('n', '<leader>tN', ':TestNearest -strategy=vimux<CR>', default_options)
map('n', '<leader>t.', ':TestLast<CR>', default_options)
map('n', '<leader>tv', ':TestVisit<CR>zz', default_options)
map('n', '<leader>ts', ':TestSuite<CR>', default_options)
map('n', '<leader>tS', ':TestSuite -strategy=vimux<CR>', default_options)
map('n', '<leader>tc', ':VimuxCloseRunner<CR>', default_options)

map('n', '<leader>ff', ':NvimTreeFindFile<CR>', default_options)
map('n', '<leader>ft', ':NvimTreeToggle<CR>', default_options)

map('n', '<leader>b', ':b#<cr>', default_options)
-- Have esc work just like it does in vim when running terminal
map('t', '<Esc>', '<c-\\><c-n>', default_options)

map('i', '<C-y>', "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {noremap = true, expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {noremap = true, expr = true})

map('n', '<leader>gs', ':G<cr>', default_options)
map('n', '<leader>gb', ':Git blame<cr>', default_options)
map('n', '<leader>gl', ':Gclog<cr>', default_options)
map('n', '<leader>gh', ':0Gclog<cr>', default_options)
map('n', '<leader>gd', ':Gdiff<cr>', default_options)
vim.keymap.set('n', '<leader>gm', '<CMD>GitMessenger<CR>')

--[[ local get_default_branch = function()
  return Job:new({
    command = 'git',
    args = { 'default-branch' }
  }):sync()[1]
end

local diff_against_default_branch = function()
  return vim.api.nvim_command("Gvdiffsplit origin/" .. get_default_branch() .. ":%")
end ]]

vim.keymap.set('n', '<leader>gD', ':Gvdiffsplit origin/main', default_options)

map('n', '<leader>go', '<CMD>Git difftool --name-only<CR>', default_options)
map('n', '<leader>gO', '<CMD>Git difftool<CR>', default_options)

map('n', '<leader>l[', '<cmd>lua vim.diagnostic.goto_prev({ wrap = true })<CR>', default_options)
map('n', '<leader>l]', '<cmd>lua vim.diagnostic.goto_next({ wrap = true })<CR>', default_options)
map('n', '<leader>l=', '<cmd>lua vim.diagnostic.show_line_diagnostics({})<CR>', default_options)

-- copy and paste
map('v', '<leader>cc', '"+y', default_options)
map('', '<leader>vv', '"+p', default_options)

-- remap G + gg to not add to jump list
--[[ map('n', 'G', ':keepjumps normal! G<cr>', default_options)
map('n', 'gg', ':keepjumps normal! gg<cr>', default_options) ]]

map('n', '<leader>il', ':vsp ~/.cache/nvim/lsp.log<CR>', default_options)

vim.keymap.set('n', '<leader>E', '<CMD>NnnExplorer<CR>')
vim.keymap.set('n', '<leader>e', '<CMD>NnnPicker %:p<CR>')
