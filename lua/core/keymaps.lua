local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

-- System clipboard
map('v', '<C-c>', '"+y', {silent=true})
map('v', '<C-x>', '"+c', {silent=true})
map('v', '<C-v>', 'c<Esc>"+p', {silent=true})
map('i', '<C-v>', '<C-r><C-o>+', {silent=true})

-- LSP
map('n', '<leader>rr', ':lua vim.lsp.buf.rename()<CR>', {silent=true})
map('n', '<leader>dd', ':lua vim.lsp.buf.definition()<CR>', {silent=true})
map('n', '<leader>di', ':lua vim.lsp.buf.implementation()<CR>', {silent=true})
map('n', '<leader>dg', ':lua vim.diagnostic.open_float(nil, { focusable = false })<CR>', {silent=true})

-- File Tree
map('n', '<leader>n', ":NvimTreeToggle <CR>", {silent=true})

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
map('n', '<leader>fb', ':Telescope buffers<CR>', {silent=true})
map('n', '<leader>fd', ':Telescope diagnostics<CR>', {silent=true})
map('n', '<leader>ff', ':Telescope fd<CR>', {silent=true})

-- Hop
map('n', '<leader>w', ':HopWord<CR>', {silent=true})

-- Buffers
map('n', '<leader>q', ':Bdelete<CR>', {silent=true})

-- Outline symbols
map('n', '<leader>ss', ':Outline<CR>', {silent=true})

-- Disable <D-space> echo
map('i', '<D-space>', '', {silent=true})

-- Todo comments
map('n', '<leader>td', ':TodoTelescope<CR>', {silent=true})

-- Neogen
map('n', '<leader>gdf', ':Neogen func<CR>', {silent=true})
map('n', '<leader>gdc', ':Neogen class<CR>', {silent=true})

-- Text bindings
map('i', '<S-Space>', '_', {silent=true}) -- underscore on Shift+Space

-- Translation
-- map('n', '<leader>tr', ":Pantran<CR>", {silent = true})

-- bindings
map('n', '<leader>ra', ':%s/\\<<C-r><C-w>\\>//g<left><left>', {silent=true}) -- replace all occurrences
