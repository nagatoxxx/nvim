local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '󰅙 '})
sign({name = 'DiagnosticSignWarn', text = ' '})
sign({name = 'DiagnosticSignHint', text = '󰋼 '})
sign({name = 'DiagnosticSignInfo', text = '󰋼 '})

vim.diagnostic.config({
    -- virtual_text = {
    --     prefix = '▎', -- Could be '■', '▎', 'x'
    -- },
    virtual_text = false,
    signs = true,
    underline = true,
    float = {
        -- border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
        border = {'', '', '', ' ', '', '', '', ' '},
        header = '',
        prefix = '',
        style = 'minimal',
    },
})

-- vim.cmd([[
    -- " set signcolumn=yes
    -- " autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])
