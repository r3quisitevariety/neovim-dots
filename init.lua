-- set up rose pine!

--require("config/transparency")
require("config/lazy")

vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.opt.tabstop = 2

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.tabstop = 2        -- Visual width of a tab character
vim.opt.shiftwidth = 2     -- Width for auto-indentation (>>/<<)
vim.opt.softtabstop = 2    -- Number of spaces a Tab key press counts forCopied!

vim.opt.linebreak = true;

vim.keymap.set('n', '<leader>w', '<cmd>set wrap!<cr>', { desc = 'Toggle word wrap' })

vim.opt.clipboard = "unnamedplus"




