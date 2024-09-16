local gitsigns = require('gitsigns')
gitsigns.setup {
  signs = {
    add          = { link = 'GitGutterAdd', text = '│' },
    change       = { link = 'GitGutterChange', text = '│' },
    delete       = { link = 'GitGutterDelete', text = '│' },
    topdelete    = { link = 'GitGutterDelete', text = '│' },
    changedelete = { link = 'GitGutterDelete', text = '│' },
  },
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
    map({ 'n' }, '<leader>g>', '<cmd>lua require\"gitsigns\".next_hunk()<CR>zz')
    map({ 'n' }, '<leader>g<', '<cmd>lua require\"gitsigns\".prev_hunk()<CR>zz')
    map({ 'n' }, '<leader>g+', '<cmd>lua require"gitsigns".stage_hunk()<CR>')
    map({ 'n' }, '<leader>g-', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
    map({ 'n' }, '<leader>g=', '<cmd>lua require"gitsigns".reset_hunk()<CR>')
    map({ 'n' }, '<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>')
  end
}
