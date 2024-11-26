-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  "tpope/vim-fugitive",
  {
    "tpope/vim-fugitive",
    requires = { "tpope/vim-rhubarb" },
  },

  {
    "vim-test/vim-test",
    requires = { "tpope/vim-dispatch", "neomake/neomake", "preservim/vimux" },
  },

  -- == Examples of Overriding Plugins ==
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        ";,,,             `       '             ,,,;",
        "`YES8888bo.       :     :       .od8888YES'",
        "   888IO8DO88b.     :   :     .d8888I8DO88",
        "   8LOVEY'  `Y8b.   `   '   .d8Y'  `YLOVE8",
        " jTHEE!  .db.  Yb. '   ' .dY  .db.  8THEE!",
        "   `888  Y88Y    `b ( ) d'    Y88Y  888'",
        "    8MYb  '\"        ,',        \"'  dMY8",
        "   j8prECIOUSgf\"'   ':'   `\"?g8prECIOUSk",
        "     'Y'   .8'     d' 'b     '8.   'Y'",
        "      !   .8' db  d'; ;`b  db '8.   !",
        "         d88  `'  8 ; ; 8  `'  88b",
        "        d88Ib   .g8 ',' 8g.   dI88b",
        "       :888LOVE88Y'     'Y88LOVE888:",
        "       '! THEE888'       `888THEE !'",
        "          '8Y  `Y         Y'  Y8'",
        "           Y                   Y",
        "           !                   !",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
