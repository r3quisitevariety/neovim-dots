require("config/lazy")
require("config/lsp")

vim.opt.relativenumber = true
vim.opt.number = true

vim.g.mapleader = " "

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Visual width of a tab character
vim.opt.shiftwidth = 2 -- Width for auto-indentation (>>/<<)
vim.opt.softtabstop = 2 -- Number of spaces a Tab key press counts forCopied!

vim.opt.linebreak = true

vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<cr>", { desc = "Toggle word wrap" })

vim.opt.clipboard = "unnamedplus"

vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume" }, {
	group = vim.api.nvim_create_augroup("auto-reload", { clear = true }),
	callback = function()
		vim.cmd.checktime()
	end,
})

require("ibl").setup() -- indent blanklines
