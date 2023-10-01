local cmd = vim.cmd         
local exec = vim.api.nvim_exec  
local g = vim.g                 
local opt = vim.opt             

opt.relativenumber = true
opt.foldmethod = 'manual' 
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
opt.colorcolumn = "120"
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8

cmd.colorscheme "catppuccin"
g.mapleader = " "
