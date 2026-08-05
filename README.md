
# nvim config

Managed by [lazy.nvim](https://github.com/folke/lazy.nvim). Plugins live in `lua/plugins/` — lazy.nvim auto-imports them all. Configuration for lsp & lazy lives in `lua/config/`, whilst the `init.lua` contains basic keybindings and vim options. 



try it out by running:
```nix
export NIX_CONFIG="experimental-features = nix-command flakes"
nix run github:r3quisitevariety/nvim
```

## Keymaps

leader key is space.

| Key | Action |
|---|---|
| `<leader>e` | Toggle file tree |
| `<C-Space>` | Toggle terminal |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (ripgrep) |
| `<leader>fb` | List buffers |
| `<leader>fh` | Help tags |
| `<leader>w` | Toggle word wrap |

### LSP

| Key | Action |
|---|---|
| `K` | Show documentation and signatures |
| `gd` | Go to symbol definition |
| `gr` | List symbol references |
| `<leader>rn` | Rename symbol and references |
| `<leader>ca` | Open code actions and refactorings |
| `[d` / `]d` | Previous / next diagnostic |

note that formatting is handled separately by conform.

### Obsidian

| Key | Action |
|---|---|
| `<leader>od` | Open daily notes picker |
| `<leader>dt` | Insert date-time stamp |

## Adding a language

Four things to check (in order):

1. **Binary** — ensure the binaries required for the LSP (i.e rust-analyzer, lua-language-server) are available in your path. Currently my binaries are managed declaratively in my nix dotfiles (separate repo).
2. **LSP** — add a `vim.lsp.config(...)` + `vim.lsp.enable(...)` in `lua/config/lsp.lua`.
3. **Formatter** — add a formatter entry in `lua/plugins/conform.lua`.
4. **Treesitter** — add the parser to `ensure_installed` in `lua/plugins/treesitter.lua`.

## Notes

- Clipboard is synced with the system (`unnamedplus`).
- Indent width = 2 spaces.
