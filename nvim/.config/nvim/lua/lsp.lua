local nvim_lsp = require "lspconfig"
local configs = require "lspconfig.configs"
local protocol = require 'vim.lsp.protocol'
local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local formatting_augrop = vim.api.nvim_create_augroup("LSPFORMATTING", {})
local on_attach = function(client, buffer_number)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = formatting_augrop, buffer = buffer_number })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = formatting_augrop,
      buffer = buffer_number,
      callback = function() vim.lsp.buf.format() end
    })
  end
end

if not configs.lexical then
  configs.lexical = {
    default_config = {
      filetypes = { "elixir", "eelixir", "heex" },
      cmd = { vim.loop.os_homedir() .. "/gh/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
      root_dir = function(fname)
        return nvim_lsp.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
      end,
      -- optional settings
      settings = {},
    },
  }
end

nvim_lsp.lexical.setup({ on_attach = on_attach })

nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
})

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescriptreact", "javascript", "javascriptreact",
    "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" }
})
