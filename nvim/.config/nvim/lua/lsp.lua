local nvim_lsp = require "lspconfig"
local protocol = require'vim.lsp.protocol'
local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, buffer_number) 
  vim.api.nvim_create_autocmd('BufWritePre', { buffer = buffer_number, callback = vim.lsp.buf.formatting_seq_sync })
end

nvim_lsp.elixirls.setup({
 capabilities = capabilities,
 on_attach = on_attach,
  cmd = {
    vim.loop.os_homedir() .. "/gh/elixir-ls/release/language_server.sh"
  };
  settings = {
    elixirLS = {
      dialyzerEnabled = false;
       suggestSpecs = true;
    }
  }
})
