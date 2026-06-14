vim.lsp.config("luals", {
	cmd = { "lua-language-server" }, --calls the binary from path
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
})

vim.lsp.config("rust", {
	cmd = { "rust-analyzer" },
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
vim.lsp.enable("gopls")
--vim.lsp.enable("harper")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(args)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
		end

		map("n", "gd", vim.lsp.buf.definition, "Goto definition")
		map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "K", vim.lsp.buf.hover, "Hover documentation")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
		map("n", "<leader>dd", vim.diagnostic.open_float, "Line diagnostics")
		map("n", "[d", vim.diagnostic.goto_next, "Next diagnostic")
		map("n", "]d", vim.diagnostic.goto_prev, "Previous diagnostic")
	end,
})
