local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    sources = {
        {
            name = 'luasnip',
            option = {
                show_autosnippets = true,
            },
            max_item_count = 4,
        },
        {
            name = 'nvim_lsp',
            max_item_count = 16,
        },
        { name = 'nvim_lsp_signature_help'},
        { name = 'path' },
    },
    window = {
        completion = cmp.config.window.bordered {
            -- border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
            border = {'', '', '', '', '', '', '', ''},
            -- col_offset = -1,
            winhighlight = "CursorLine:IncSearch,Normal:Background,FloatBorder:Border",
            -- winhighlight = "CursorLine:IncSearch,Normal:Background,FloatBorder:Background",
            scrollbar = false,
        },
        documentation = cmp.config.window.bordered {
            -- border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
            border = {'', '', '', '', '', '', '', ''},
            winhighlight = "Search:PmenuSel,Normal:Background,FloatBorder:Background",
            side_padding = 1,
        }
    },
    formatting = {
        fields = {'abbr', 'kind'},
    },
    sorting = {
        comparators = {
            cmp.config.compare.recently_used
        }
    }
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
