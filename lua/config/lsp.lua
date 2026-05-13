vim.lsp.config('luals', {
  cmd = { 'lua-language-server' }, --calls the binary from path
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
})

vim.lsp.config('rust', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml' },
})

vim.lsp.config("tsserver", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git" }),
})

vim.lsp.config("nixd", {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_dir = vim.fs.root(0, { "flake.nix", "flake.lock", ".git", "default.nix" }),
})

-- ENABLE / DISABLE LANGUAGES --
--------------------------------------------
vim.lsp.enable('luals') -- calls the config
vim.lsp.enable('rust')
vim.lsp.enable("tsserver")
vim.lsp.enable("nixd")
