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
          ["<leader>/"] = { ":silent grep -i ", noremap = true },
          ["<leader>lh"] = { ":lua vim.lsp.buf.hover()<cr>", noremap = true },
          ["<leader>ld"] = { ":lua vim.lsp.buf.definition()<cr>", noremap = true },
          ["<Leader>b"] = { ":b#<cr>", noremap = true },
          ["<localleader>gs"] = { ":G<cr>", noremap = true },
          ["<Leader>gb"] = { ":Git blame<cr>", noremap = true },
          ["<Leader>gl"] = { ":Gclog<cr>", noremap = true },
          ["<Leader>gh"] = { ":0Gclog<cr>", noremap = true },
          ["<Leader>gd"] = { ":Gdiff<cr>", noremap = true },
          ["<Leader>tT"] = { ':require("neotest").run.run(vim.fn.expand("%"))', noremap = true },
          ["<Leader>tN"] = { ":Neotest run<cr>", noremap = true },
          ["<Leader>to"] = { ':require("neotest").output.open({ enter = true })<cr>', noremap = true },
          ["<Leader>t."] = { ":TestLast<CR>", noremap = true },
          ["<Leader>tv"] = { ":TestVisit<CR>zz", noremap = true },
          ["<Leader>ts"] = { ":TestSuite<CR>", noremap = true },
          ["<Leader>tS"] = { ":TestSuite -strategy=vimux_watch<CR>", noremap = true },
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
