local nvim_lsp = require "lspconfig"
local protocol = require'vim.lsp.protocol'
local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.elixirls.setup({
 capabilities = capabilities,
  cmd = {
    vim.loop.os_homedir() .. "/.elixir-ls/rel/language_server.sh"
  };
  settings = {
    elixirLS = {
      dialyzerEnabled = false;
       suggestSpecs = true;
    }
  }
})
