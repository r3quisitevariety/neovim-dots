return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = { "markdown", "markdown_inline", "nix", "rust", "typescript" },
		highlight = { enable = true },
	},
}
