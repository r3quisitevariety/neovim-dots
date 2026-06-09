-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({ variant = "moon", extend_background_behind_borders = false })
		vim.cmd("colorscheme rose-pine")
		require("transparent").clear()
	end
}
