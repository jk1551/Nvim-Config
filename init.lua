-- JK Nvim Settings

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.g.mapleader = " "

-- install lazy.nvim if not installed yet so i can reproduce on new machines
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")


vim.o.termguicolors = true
vim.g.tokyonight_style = "storm"
vim.cmd([[colorscheme tokyonight]])

-- map some telescope keys

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })

-- file tree toggle
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

vim.keymap.set("i", "jj", "<ESC>", { silent = true })

local opts = { noremap = true, silent = true }
-- normal mode key disables
vim.keymap.set('n', '<Up>',    '<cmd>echo "You can\'t use up"<CR>', opts)
vim.keymap.set('n', '<Down>',  '<cmd>echo "You can\'t use down"<CR>', opts)
vim.keymap.set('n', '<Left>',  '<cmd>echo "You can\'t use left"<CR>', opts)
vim.keymap.set('n', '<Right>', '<cmd>echo "You can\'t use right"<CR>', opts)

-- Insert mode
vim.keymap.set('i', '<Up>',    '<C-o>:echo "You can\'t use up"<CR>', opts)
vim.keymap.set('i', '<Down>',  '<C-o>:echo "You can\'t use down"<CR>', opts)
vim.keymap.set('i', '<Left>',  '<C-o>:echo "You can\'t use left"<CR>', opts)
vim.keymap.set('i', '<Right>', '<C-o>:echo "You can\'t use right"<CR>', opts)

-- Visual mode
vim.keymap.set('v', '<Up>',    ':<C-u>echo "You can\'t use up"<CR>', opts)
vim.keymap.set('v', '<Down>',  ':<C-u>echo "You can\'t use down"<CR>', opts)
vim.keymap.set('v', '<Left>',  ':<C-u>echo "You can\'t use left"<CR>', opts)
vim.keymap.set('v', '<Right>', ':<C-u>echo "You can\'t use right"<CR>', opts)


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    severity_sort = true,
})
