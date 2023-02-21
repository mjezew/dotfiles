local gitsigns = require('gitsigns')
gitsigns.setup {
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '│'},
    change       = {hl = 'GitGutterChange', text = '│'},
    delete       = {hl = 'GitGutterDelete', text = '│'},
    topdelete    = {hl = 'GitGutterDelete', text = '│'},
    changedelete = {hl = 'GitGutterDelete', text = '│'},
  },
  on_attach = function(bufnr) 
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
    map({'n'}, '<leader>g>', '<cmd>lua require\"gitsigns\".next_hunk()<CR>zz')
    map({'n'}, '<leader>g<', '<cmd>lua require\"gitsigns\".prev_hunk()<CR>zz')
    map({'n'}, '<leader>g+', '<cmd>lua require"gitsigns".stage_hunk()<CR>')
    map({'n'}, '<leader>g-', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
    map({'n'}, '<leader>g=', '<cmd>lua require"gitsigns".reset_hunk()<CR>')
    map({'n'}, '<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>')
  end
}
