return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			mode = "tabs",
			themable = false,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count)
				return " " .. count
			end,
		},
	},
}
