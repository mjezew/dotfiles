vim.cmd [[packadd packer.nvim]]
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
return require("packer").startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use { "morhetz/gruvbox", config = function() vim.cmd("colorscheme gruvbox") end }
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.8',
    requires = { { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-symbols.nvim' } },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "-g",
            "!.git"
          }
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = { hidden = true }
        },
        extensions = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      })

      telescope.load_extension("fzf")
    end
  }
  use "elixir-editors/vim-elixir"
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('status-line') end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use {
    'janko/vim-test',
    requires = { 'tpope/vim-dispatch', 'neomake/neomake', 'preservim/vimux' }
  }
  use 'jiangmiao/auto-pairs'
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('tree') end
  }
  use {
    'christoomey/vim-tmux-navigator',
    config = function()
      vim.g.tmux_navigator_disable_when_zoomed = true
    end
  }
  use {
    'dense-analysis/ale',
    config = function()
      require('formatting')
    end
  }
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require 'compe'.setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = 'enable',
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,
        source = {
          path = true,
          buffer = true,
          calc = true,
          nvim_lsp = true,
          nvim_lua = true,
          vim_dadbod_completion = true,
          vsnip = true
        }
      }
    end
  }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('git')
    end
  }
  use {
    'tpope/vim-fugitive',
    requires = { 'tpope/vim-rhubarb' }
  }
  use 'tpope/vim-endwise'
  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  }
  --[[ use {
   'justinmk/vim-sneak',
   config = function() vim.g["sneak#label"] = true end
  } ]]
  use {
    'vimwiki/vimwiki',
    branch = 'dev',
    config = function()
      require('wiki')
    end
  }
  use { 'luukvbaal/nnn.nvim',
    config = function()
      local nnn = require("nnn")
      require('nnn').setup {
        mappings = {
          { "<C-t>", nnn.builtin.open_in_tab },    -- open file(s) in tab
          { "<C-s>", nnn.builtin.open_in_split },  -- open file(s) in split
          { "<C-v>", nnn.builtin.open_in_vsplit }, -- open file(s) in vertical split
        }
      }
    end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }
  use { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' }
  use {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_settings = {
        elixir = {
          extends = 'html'
        },
        eelixir = {
          extends = 'html'
        },
        heex = {
          extends = 'html'
        }
      }
      vim.g.user_emmet_mode = 'inv'
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground'
    },
    config = function()
      require 'nvim-treesitter.configs'.setup(
        {
          ensure_installed = "all",
          highlight = {
            enable = false
          },
          textobjects = {
            select = {
              enable = true,
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["ic"] = "@comment.inner",
                ["ac"] = "@comment.outer",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["am"] = "@class.outer",
                ["im"] = "@class.inner",
                ["ib"] = "@block.inner",
                ["ab"] = "@block.outer"
              }
            }
          }
        }
      )
    end
  }
  use {
    'tpope/vim-dadbod',
    requires = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion'
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_execute_on_save = false
      vim.g.db_ui_save_location = "./mjezew_queries"
      vim.g.db_ui_disable_mappings = true
    end
  }
  use {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lexical", "lua_ls" },
        automatic_installation = true
      })
    end
  }
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end
  }
end)
