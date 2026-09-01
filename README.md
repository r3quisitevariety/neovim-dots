
# nvim config

- utilizes [lazy.nvim](https://github.com/folke/lazy.nvim) 
- plugins live in `lua/plugins/` which are auto-imported by lazy.nvim
- configuration for lsp & lazy.nvim's bootstrap lives in `lua/config/` 
- top level `init.lua` for everything else (cant be bothered to organize it)

try it out by running:
```nix
export NIX_CONFIG="experimental-features = nix-command flakes"
nix run github:r3quisitevariety/nvim
```

or `nix run github:r3quisitevariety/neovim-dots#shell` for an interactive shell in your `$PATH`

alternatively, run `git clone https://github.com/r3quisitevariety/nvim` in `~/.config` (ensuring previous nvim config is backed up). make sure you have all the necessary lsp servers installed.

## Keymaps

leader key is space.

### General

| Key | Action |
|---|---|
| `<leader>e` | Toggle file tree |
| `<C-Space>` | Toggle terminal |
| `<leader>w` | Toggle word wrap |
| `1g` ... `9g` | Go to tab 1 ... 9 |
| `q` | Flash jump |

### Search

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fh` | Search help tags |

### Git

| Key | Action |
|---|---|
| `<leader>lg` | Open LazyGit |
| `]h` / `[h` | Next / previous changed hunk |
| `<leader>hp` | Preview changed hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff current file |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |

### Gitpad

| Key | Action |
|---|---|
| `<leader>pp` | Toggle project notes |
| `<leader>pb` | Toggle branch notes |
| `<leader>pf` | Toggle notes for the current file |

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
