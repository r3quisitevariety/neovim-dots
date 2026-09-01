require("config/lazy")
require("config/lsp")
require("oil").setup()
require("ibl").setup() -- indent blanklines

vim.opt.swapfile = false -- Disables swap files
vim.opt.undofile = true -- Saves undo history even after closing Neovim

vim.opt.relativenumber = true
vim.opt.number = true

vim.g.mapleader = " "

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Visual width of a tab character
vim.opt.shiftwidth = 2 -- Width for auto-indentation (>>/<<)
vim.opt.softtabstop = 2 -- Number of spaces a Tab key press counts for

vim.opt.linebreak = true

vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<cr>", { desc = "Toggle word wrap" })

-- so i can do `1g` instead of `1gt`
for tab = 1, 9 do
	vim.keymap.set("n", tab .. "g", "<cmd>tabnext " .. tab .. "<cr>", {
		desc = "Go to tab " .. tab,
	})
end

vim.opt.fillchars:append({ eob = " " })

vim.opt.clipboard = "unnamedplus"

vim.opt.autoread = true

--autodetects changes in current file
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume" }, {
	group = vim.api.nvim_create_augroup("auto-reload", { clear = true }),
	callback = function()
		vim.cmd.checktime()
	end,
})

vim.opt.termguicolors = true

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
-- Reapply on colorscheme change to maintain transparency
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = make_transparent,
})
