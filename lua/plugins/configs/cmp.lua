local cmp = require('cmp')

local colors = require("catppuccin.palettes").get_palette "mocha"

vim.api.nvim_set_hl(0, "Border", {fg = colors.surface2})
vim.api.nvim_set_hl(0, "Background", {bg = colors.base, fg = colors.text})

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
            max_item_count = 8,
        },
        { name = 'nvim_lsp_signature_help'},
        { name = 'buffer'},
        { name = 'path' },
    },
    window = {
        completion = cmp.config.window.bordered {
            border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
            col_offset = -1,
            winhighlight = "CursorLine:IncSearch,Normal:Background,FloatBorder:Border",
            scrollbar = false,
        },
        documentation = cmp.config.window.bordered {
            border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
            winhighlight = "Search:PmenuSel,Normal:Background,FloatBorder:Border",
            side_padding = 1,
        }
    },
    formatting = {
        fields = {'abbr', 'kind'},
    },
})
