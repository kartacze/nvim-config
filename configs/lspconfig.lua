local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lsp_flags = require("plugins.configs.lspconfig").lsp_flags

-- local prettier_d = require "efmls-configs.formatters.prettier_d"
-- local eslint_d = require "efmls-configs.linters.eslint_d"

-- local stylua = require "efmls-configs.formatters.stylua"

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

--
-- lspconfig.pyright.setup { blabla}
--
--
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

-- local languages = require('efmls-configs.defaults').languages()
--
-- languages = vim.tbl_extend('force', languages, {
--   -- Custom languages, or override existing ones
--   html = {
--     require('efmls-configs.formatters.prettier'),
--   },
--       lua = {
--         stylua,
--       },
-- })

--
-- local efmls_config = {
--   filetypes = vim.tbl_keys(languages),
--   settings = {
--     rootMarkers = { '.git/' },
--     languages = languages,
--   },
--   init_options = {
--     documentFormatting = true,
--     documentRangeFormatting = true,
--   },
-- }
--
-- lspconfig.efm.setup(vim.tbl_extend('force', efmls_config, {
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }))

-- lspconfig.efm.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "lua" },
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = languages
--     }
-- }
