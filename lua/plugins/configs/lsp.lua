vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

-- sign({name = 'DiagnosticSignError', text = ' '})
-- sign({name = 'DiagnosticSignWarn', text = ' '})
-- sign({name = 'DiagnosticSignHint', text = ' '})
-- sign({name = 'DiagnosticSignInfo', text = ' '})

sign({name = 'DiagnosticSignError', text = '!'})
sign({name = 'DiagnosticSignWarn', text = '~'})
sign({name = 'DiagnosticSignHint', text = 'h'})
sign({name = 'DiagnosticSignInfo', text = 'i'})


vim.diagnostic.config({
    virtual_text = {
        prefix = '■ ', -- Could be '■', '▎', 'x'
    },
    signs = true,
    -- update_in_insert = false,
    underline = true,
    -- severity_sort = false,
    float = {
        border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
    --     source = 'always',
        header = '',
        prefix = '',
    },
})

