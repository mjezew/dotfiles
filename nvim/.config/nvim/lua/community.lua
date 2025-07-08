-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.elixir-phoenix" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.test.vim-test" },
  { import = "astrocommunity.pack.biome" },
  -- import/override with your plugins folder
}
