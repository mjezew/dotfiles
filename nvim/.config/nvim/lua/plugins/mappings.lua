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
          [";"] = { ":", noremap = true },
          [":"] = { ";", noremap = true },
          ["<leader>/"] = { ":silent grep -i ", noremap = true },
          ["<Leader>b"] = { ":b#<cr>", noremap = true },
          ["<localleader>gs"] = { ":G<cr>", noremap = true },
          ["<Leader>gb"] = { ":Git blame<cr>", noremap = true },
          ["<Leader>gl"] = { ":Gclog<cr>", noremap = true },
          ["<Leader>gh"] = { ":0Gclog<cr>", noremap = true },
          ["<Leader>gd"] = { ":Gdiff<cr>", noremap = true },
          ["<Leader>tt"] = { ":TestFile -strategy=vimux<CR>", noremap = true },
          ["<Leader>tn"] = { ":TestNearest -strategy=vimux<CR>", noremap = true },
          ["<Leader>t."] = { ":TestLast -strategy=vimux<CR>", noremap = true },
          ["<Leader>tv"] = { ":TestVisit<CR>", noremap = true },
          ["<Leader>ts"] = { ":TestSuite -strategy=vimux<CR>", noremap = true },
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
