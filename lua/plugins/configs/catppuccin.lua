return {
    flavour = 'mocha',
    integrations = {
        cmp = true,
        bufferline = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        treesitter = true,
        neotree = true,
    },
    color_overrides = {
        mocha = {
            surface0 = "#313131",
            surface1 = "#454545",

            base = "#202020",
            mantle = "#191919",
            crust = "#111111",
        },
    },
    custom_highlights = function(colors)
        return {
            ColorColumn  = { bg = colors.surface0 },
            TabLine      = { fg = colors.surface2 },
            TabLineFill  = { bg = colors.mantle },
            TabLineSel   = { bg = colors.lavender, fg = '#000000' },
            WinSeparator = { fg = colors.surface1 },
            Border       = { fg = colors.surface2 },
            Background   = { bg = colors.base, fg = colors.text },
            MsgArea      = { bg = colors.mantle },
            LineNr       = { fg = colors.lavender },
            LineNrBelow  = { fg = colors.surface1 },
            LineNrAbove  = { fg = colors.surface1 }
        }
    end
}
