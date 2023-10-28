local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

opt.relativenumber = true
-- opt.foldmethod = 'manual'
opt.expandtab = true
opt.tabstop = 4
opt.smarttab = true
opt.softtabstop = 4
opt.shiftwidth = 4
opt.ttyfast = true
opt.hlsearch = false
opt.ignorecase = true
opt.clipboard = 'unnamedplus'
opt.nu = true
opt.cursorline = true
opt.hidden = true
opt.swapfile = false
opt.colorcolumn = "80"
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8
opt.cmdheight = 0
opt.undofile = true
opt.wrap = false
opt.fillchars = { eob = " " } -- disable `~` on nonexistent lines

g.mapleader = " "
g.inlay_hints_enabled = false

cmd.colorscheme "catppuccin"
