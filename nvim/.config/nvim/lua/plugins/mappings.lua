return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          [";"] = { ":", noremap = true },
          [":"] = { ";", noremap = true },
          ["<leader>fg"] = { "<cmd>lua require'telescope.builtin'.git_status()<cr>", noremap = true },
          ["<leader>b"] = { ":b#<cr>", noremap = true },
          ["<leader>gs"] = { ":G<cr>", noremap = true },
          ["<leader>gb"] = { ":Git blame<cr>", noremap = true },
          ["<leader>gl"] = { ":Gclog<cr>", noremap = true },
          ["<leader>gh"] = { ":0Gclog<cr>", noremap = true },
          ["<leader>gd"] = { ":Gdiff<cr>", noremap = true },
          ["<leader>tt"] = { ":TestFile<CR>", noremap = true },
          ["<leader>tT"] = { ":TestFile -strategy=vimux_watch<CR>", noremap = true },
          ["<leader>tn"] = { ":TestNearest<CR>", noremap = true },
          ["<leader>tN"] = { ":TestNearest -strategy=vimux_watch<CR>", noremap = true },
          ["<leader>t."] = { ":TestLast<CR>", noremap = true },
          ["<leader>tv"] = { ":TestVisit<CR>zz", noremap = true },
          ["<leader>ts"] = { ":TestSuite<CR>", noremap = true },
          ["<leader>tS"] = { ":TestSuite -strategy=vimux_watch<CR>", noremap = true },
        },
        v = {
          [";"] = { ":", noremap = true },
          [":"] = { ";", noremap = true },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
