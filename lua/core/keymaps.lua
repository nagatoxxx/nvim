local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

-- Системный буфер обмена
map('v', '<C-c>', '"+y', {})
map('v', '<C-x>', '"+c', {})
map('v', '<C-v>', 'c<Esc>"+p', {})
map('i', '<C-v>', '<C-r><C-o>+', {})

-- LSP
map('n', '<leader>rr', ":lua vim.lsp.buf.rename()<CR>", {})

-- File Tree
map('n', '<leader>n', ":NvimTreeToggle <CR>", {})

-- LuaSnip
local ls = require('luasnip')
set({"i"}, "<C-x>",     function() ls.expand() end, {silent = true})
set({"i", "s"}, "<C-j>", function() ls.jump( 1) end, {silent = true})
set({"i", "s"}, "<C-k>", function() ls.jump(-1) end, {silent = true})

set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- Telescope
-- map('n', '<leader>fb', ':Telescope buffers<CR>', {})
-- map('n', '<leader>fd', ':Telescope diagnostics<CR>', {})
-- map('n', '<leader>ff', ':Telescope fd<CR>', {})

-- Hop
map('n', '<leader>w', ':HopWord<CR>', {})

-- Buffers
map('n', '<leader>q', ':Bdelete<CR>', {})

-- Outline symbols
map('n', '<leader>ss', ':SymbolsOutline<CR>', {})
