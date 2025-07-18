local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy options
local plugins = require("plugins.list")
local opts = {
    install = {
        missing = true,
        colorscheme = { "catppuccin" },
    },
}

require("lazy").setup(plugins, opts)
require('plugins.configs.lsp')
