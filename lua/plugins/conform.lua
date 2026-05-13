return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      rust = { "rustfmt" },
      nix = { "nixfmt" },
      lua = { "stylua" },
    },

  },
  -- still see if this actually works, havent set up lsp yet
}
