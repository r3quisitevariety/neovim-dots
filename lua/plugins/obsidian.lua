return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	keys = {
		{ "<Leader>od", "<Cmd>Obsidian dailies<CR>", desc = "obsidian daily notes" },
		{
			"<leader>dt",
			function()
				local date_str = os.date("%A, [[%B %-d, %Y]], %I:%M %p")
				vim.api.nvim_put({ date_str }, "l", true, true)
			end,
			desc = "Insert date-time stamp",
		},
	},

	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = "obsidian",
				path = "~/Documents/obsidian",
			},
		},

		ui = {
			enable = false,
		},

		daily_notes = {
			enabled = true,
			folder = "zzz/dailynotes",
			date_format = "%B %-d, %Y",
			default_tags = "type/dailynotes",
		},
	},
}
