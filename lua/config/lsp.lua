vim.lsp.config("luals", {
	cmd = { "lua-language-server" }, --calls the binary from path
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
})

vim.lsp.config("rust", {
	cmd = { "rust-analyzer" }, -- from rustup
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
})

vim.lsp.config("tsserver", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_markers = { "package.json", "tsconfig.json", ".git" },
})

vim.lsp.config("nix", {
	cmd = { "nil" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", "flake.lock", ".git", "default.nix" },
	settings = {
		["nil"] = {
			nix = {
				autoArchive = true, -- Automatically fetch inputs, suppressing the popup
			},
		},
	},
})

vim.lsp.config["harper"] = {
	cmd = { "harper-ls", "--stdio" },
	filetypes = { "markdown", "text", "tex", "typst" },
}

vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
})

-- ENABLE / DISABLE LANGUAGES --
--------------------------------------------
vim.lsp.enable("luals") -- calls the config
vim.lsp.enable("rust")
vim.lsp.enable("tsserver")
vim.lsp.enable("nix")
--vim.lsp.enable("harper")
vim.lsp.enable("gopls")
