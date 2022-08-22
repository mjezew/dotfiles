local tree = require 'nvim-tree'
vim.g.nvim_tree_width_allow_resize = true;
tree.setup {
  disable_netrw = false,
  renderer = {
          icons = {
                  show = {
                        file = true,
                        folder = false,
                        git = false
                  },
           glyphs = {
           default = '',
           symlink = '',
           git = {
             unstaged = "✗",
             staged = "✓",
             unmerged = "",
             renamed = "➜",
             untracked = "★"
           },
           folder = {
             default = " ",
             open = " "
           }
           }
          }
  }
}
