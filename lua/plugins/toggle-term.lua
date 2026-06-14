return {
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		version = "*",
		keys = {
			{ "<C-Space>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" } },
		},
		opts = {
			size = 20,
			open_mapping = [[<C-Space>]],
			--direction = "tab",
			hide_numbers = true,
			terminal_mappings = true,
		},
	},
}
