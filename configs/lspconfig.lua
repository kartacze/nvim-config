local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lsp_flags = require("plugins.configs.lspconfig").lsp_flags

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.kotlin_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  init_options = {
    provideFormatter = false,
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
}

-- lspconfig.eslint.setup {}

-- lspconfig.denols.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
-- }

lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  -- Unix
  cmd = { "/Users/teodorp/Programs/elixir-ls/release/language_server.sh" },
  elixirLS = {
    -- I choose to disable dialyzer for personal reasons, but
    -- I would suggest you also disable it unless you are well
    -- aquainted with dialzyer and know how to use it.
    dialyzerEnabled = false,
    -- I also choose to turn off the auto dep fetching feature.
    -- It often get's into a weird state that requires deleting
    -- the .elixir_ls directory and restarting your editor.
    fetchDeps = false,
  },
}
