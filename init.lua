require("bootstrap")
vim.g.mapleader = " "
require("lazy").setup("plugins")

vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4

require("remap")
require("adapters")
