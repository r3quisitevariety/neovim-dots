
# nvim config

Managed by [lazy.nvim](https://github.com/folke/lazy.nvim). Plugin specs live in `lua/plugins/` — lazy.nvim auto-imports them all. Config modules are in `lua/config/`.

try it out by running `nix run github:r3quisitevariety/neovim-dots`

## Keymaps

| Key | Action |
|---|---|
| `<leader>e` | Toggle file tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (ripgrep) |
| `<leader>fb` | List buffers |
| `<leader>fh` | Help tags |
| `<C-Space>` | Toggle terminal |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>w` | Toggle word wrap |

### Obsidian

| Key | Action |
|---|---|
| `<leader>od` | Open daily notes picker |
| `<leader>dt` | Insert date-time stamp |

## Adding a language

Four things to check (in order):

1. **Binary** — ensure the LSP server, formatter, and treesitter parser are available (eventually via Nix).
2. **LSP** — add a `vim.lsp.config(...)` + `vim.lsp.enable(...)` in `lua/config/lsp.lua`.
3. **Formatter** — add a formatter entry in `lua/plugins/conform.lua`.
4. **Treesitter** — add the parser to `ensure_installed` in `lua/plugins/treesitter.lua`.

## Notes

- Clipboard is synced with the system (`unnamedplus`).
- Leader key is `<Space>`.
- Indent width = 2 spaces.
- LSP servers configured: luals, rust-analyzer, typescript-language-server, nil, gopls.
