-- local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        local utils = require("nvim-tree.utils")

        -- Если это не буфер NvimTree, нам тут нечего делать
        if not utils.is_nvim_tree_buf() then
            return
        end

        -- Получаем текущий таб
        local tab = vim.api.nvim_get_current_tabpage()
        local wins = vim.api.nvim_tabpage_list_wins(tab)

        -- Собираем уникальные буферы в окнах этого таба
        local bufs = {}
        for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            bufs[buf] = true
        end

        -- Если буфер только один и это NvimTree → закрываем
        if vim.tbl_count(bufs) == 1 then
            vim.cmd("quit")
        end
    end
})

autocmd("BufWinLeave", {
    pattern = { "*.*" },
    desc = "save view (folds), when closing file",
    command = "mkview",
})

autocmd("BufWinEnter", {
    pattern = { "*.*" },
    desc = "load view (folds), when opening file",
    command = "silent! loadview"
})
