local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- augroup('ClangFormat', { clear = true })
-- autocmd('Filetype', {
--     group = 'ClangFormat',
--     pattern = { 'cpp', 'c', 'h', 'hpp' },
--     command = 'ClangFormatAutoEnable'
-- })

autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

autocmd("BufWinLeave", {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})

autocmd("BufWinEnter", {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})
