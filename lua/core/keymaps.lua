local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

-- Системный буфер обмена
map('v', '<C-c>', '"+y', {})
map('v', '<C-x>', '"+c', {})
map('v', '<C-v>', 'c<Esc>"+p', {})
map('i', '<C-v>', '<C-r><C-o>+', {})

-- Fast save
map('n', 'W', ":w!<CR>", {})

-- LSP
map('n', '<leader>rr', ":lua vim.lsp.buf.rename()<CR>", {})

-- BufferLine
map('n', '<A-1>', ":BufferLineGoToBuffer 1<CR>", {})
map('n', '<A-2>', ":BufferLineGoToBuffer 2<CR>", {})
map('n', '<A-3>', ":BufferLineGoToBuffer 3<CR>", {})
map('n', '<A-4>', ":BufferLineGoToBuffer 4<CR>", {})
map('n', '<A-5>', ":BufferLineGoToBuffer 5<CR>", {})
map('n', '<A-6>', ":BufferLineGoToBuffer 6<CR>", {})
map('n', '<A-7>', ":BufferLineGoToBuffer 7<CR>", {})
map('n', '<A-8>', ":BufferLineGoToBuffer 8<CR>", {})
map('n', '<A-9>', ":BufferLineGoToBuffer 9<CR>", {})
map('n', '<C-c>', ":bd<CR>", {})

map('n', '<C-n>', ":bnext<CR>", {})
map('n', '<C-p>', ":bprevious<CR>", {})

-- NvimTree
map('n', '<F2>', ":NvimTreeToggle <CR>", {})

-- LuaSnip
ls = require('luasnip')
set({"i"}, "<C-x>",     function() ls.expand() end, {silent = true})
set({"i", "s"}, "<C-j>", function() ls.jump( 1) end, {silent = true})
set({"i", "s"}, "<C-k>", function() ls.jump(-1) end, {silent = true})

set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
