return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
	},
	opts = {
		options = {
			themable = true,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count)
				return " " .. count
			end,
		},
	},
}
