local cmp = require('cmp')

-- local function border(hl_name)
--   return {
--     { "┌", hl_name },
--     { "─", hl_name },
--     { "┐", hl_name },
--     { "│", hl_name },
--     { "┘", hl_name },
--     { "─", hl_name },
--     { "└", hl_name },
--     { "│", hl_name },
--   }
-- end
--
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
        { name = 'nvim_lsp', max_item_count = 8 },
        { name = 'nvim_lsp_signature_help'},
        { name = 'buffer'}, 
        { name = 'path' },
    },
    window = {
        completion = cmp.config.window.bordered {
            border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
            -- border = border "CmpMenuBorder",
            col_offset = -1,
            side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
            winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenu,CursorLine:IncSearch",
            scrollbar = false,
        },
        documentation = cmp.config.window.bordered {
            -- border = border "CmpDocBorder",
            border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
            winhighlight = "Search:PmenuSel,Normal:CmpDoc,FloatBorder:CmpMenu",
            side_padding = 1,
        }
    },
    formatting = {
        fields = {'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ ',
                luasnip = ' ',
                buffer = 'Ω ',
                path = ' ',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})
