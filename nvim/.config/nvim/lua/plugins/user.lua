-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  "tpope/vim-fugitive",
  {
    "tpope/vim-fugitive",
    requires = { "tpope/vim-rhubarb" },
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
            ;,,,             `       '             ,,,;,
            `YES8888bo.       :     :       .od8888YES',
            888IO8DO88b.     :   :     .d8888I8DO88,
            8LOVEY'  `Y8b.   `   '   .d8Y'  `YLOVE8,
            jTHEE!  .db.  Yb. '   ' .dY  .db.  8THEE!,
            `888  Y88Y    `b ( ) d'    Y88Y  888',
            8MYb  '\"        ,',        \"'  dMY8,
            j8prECIOUSgf\"'   ':'   `\"?g8prECIOUSk,
            'Y'   .8'     d' 'b     '8.   'Y',
            !   .8' db  d'; ;`b  db '8.   !,
            d88  `'  8 ; ; 8  `'  88b,
            d88Ib   .g8 ',' 8g.   dI88b,
            :888LOVE88Y'     'Y88LOVE888:,
            '! THEE888'       `888THEE !',
            '8Y  `Y         Y'  Y8',
            Y                   Y,
            !                   !, 
          ]],
        },
      },
    },
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

  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require "elixir"
      local elixirls = require "elixir.elixirls"

      elixir.setup {
        nextls = { enable = false },
        elixirls = {
          enable = true,
          repo = "elixir-lsp/elixir-ls",
          tag = "v0.27.2",
          settings = elixirls.settings {
            dialyzerEnabled = true,
            incrementalDialyzer = true,
            fetchDeps = true,
            suggestSpecs = true,
            enableTestLenses = false,
          },
          -- on_attach = function(client, bufnr)
          -- vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          -- vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          -- vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          -- end,
        },
        credo = { enable = true },
        projectionist = {
          enable = true,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "preservim/vimux",
    config = function()
      vim.g["test#preserve_screen"] = false
      vim.g["test#strategy"] = {
        nearest = "vimux",
        file = "vimux",
        suite = "vimux",
      }
      vim.g["VimuxOrientation"] = "h"
      vim.g["VimuxHeight"] = "35%"
      vim.g["VimuxCloseOnExit"] = true
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_save_location = "./mjezew_queries"
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
