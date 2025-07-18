return {
    flavour = 'mocha',
    styles = {

    },
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
        gitgraph = true,
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
            WinSeparator            = { fg = colors.surface1 },
            Border                  = { fg = colors.surface2 }, -- cmp border
            Background              = { bg = colors.mantle, fg = colors.text }, -- cmp background
            MsgArea                 = { bg = colors.mantle },
            LineNr                  = { fg = colors.text },
            LineNrBelow             = { fg = colors.surface1 },
            LineNrAbove             = { fg = colors.surface1 },
            DiagnosticFloatingError = { bg = colors.mantle },
            DiagnosticFloatingWarn  = { bg = colors.mantle },
            DiagnosticFloatingInfo  = { bg = colors.mantle },
            DiagnosticFloatingOk    = { bg = colors.mantle },
            DiagnosticFloatingHint  = { bg = colors.mantle },
            NormalFloat             = { bg = colors.mantle },
            FloatBorder             = { fg = colors.surface2 },
            Folded                  = { fg = colors.lavender, bg = colors.surface1 }
        }
    end
}


