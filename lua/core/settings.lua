local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

opt.relativenumber = true
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
-- opt.cursorline = true
opt.hidden = true
opt.swapfile = false
-- opt.colorcolumn = "80"
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 4
opt.cmdheight = 0
opt.undofile = true
opt.wrap = false
-- opt.laststatus = 3
opt.fillchars = {
    eob = ' ',
}

g.mapleader = " "
g.inlay_hints_enabled = true

cmd.colorscheme "catppuccin"
