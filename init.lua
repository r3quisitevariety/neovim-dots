-- IMPORTS --
require("config/lazy")
require("config/lsp")
require("oil").setup()
require("ibl").setup() -- indent blanklines

-- OPTIONS --
vim.opt.swapfile = false -- bye bye swapfiles
vim.opt.undofile = true -- session-persistent undo history
vim.opt.relativenumber = true
vim.opt.number = true
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true -- use literal spaces instead of tabs
vim.opt.tabstop = 2 -- visual width of a tab
vim.opt.shiftwidth = 2 -- width for auto-indentation (>>/<<)
vim.opt.softtabstop = 2 -- number of spaces a Tab key press counts for
vim.opt.linebreak = true
vim.opt.autoread = true
vim.opt.termguicolors = true

-- SHORTCUTS/MISC --
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<cr>", { desc = "Toggle word wrap" })

-- so i can do `1g` instead of `1gt`
for tab = 1, 9 do
	vim.keymap.set("n", tab .. "g", "<cmd>tabnext " .. tab .. "<cr>", {
		desc = "Go to tab " .. tab,
	})
end

--autodetects changes in current file
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume" }, {
	group = vim.api.nvim_create_augroup("auto-reload", { clear = true }),
	callback = function()
		vim.cmd.checktime()
	end,
})

-- COSMETICS --
-- removes the ~ ~ ~ on the left side of neovim
vim.opt.fillchars:append({ eob = " " })
-- makes neovim transparent
local function make_transparent()
	local groups = {
		"Normal",
		"NormalNC",
		"NormalFloat",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
		"NeoTreeNormal",
		"NeoTreeNormalNC",
		"LineNr",
		"CursorLineNr",
		"LineNrAbove",
		"LineNrBelow",
	}
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
	end
end
make_transparent()
-- reapply on colorscheme change to maintain transparency
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = make_transparent,
})
