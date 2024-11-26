return {
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    opts = {
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
      }
    },
  }
