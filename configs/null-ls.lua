local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettierd.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "scss",
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "json",
      "yaml",
    },
  }, -- so prettier works only on these filetypes

  b.code_actions.eslint_d,
  b.diagnostics.eslint_d,
  --
  -- b.formatting.deno_fmt,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- styles
  b.diagnostics.stylelint,

  -- kotlin
  -- b.diagnostics.ktlint,
  b.formatting.ktlint,


  -- elixir
  b.diagnostics.credo,
  b.formatting.mix
}

null_ls.setup {
  debug = false,
  sources = sources,
}
