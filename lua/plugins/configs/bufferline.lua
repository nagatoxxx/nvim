local mocha = require("catppuccin.palettes").get_palette "mocha"
require('bufferline').setup{
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        offsets = {{filetype = "NvimTree", text = "", text_align ="center", separator=false}},
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        separator_style = {'', ''},
        always_show_bufferline = false,
    },
    highlights =  {
        fill = {
            bg = mocha.crust,
            fg = mocha.text,
        },
        buffer_selected = {
            fg = mocha.text,
        },
        buffer_visible = {
            bg = mocha.base,
            fg = mocha.text,
        },
        indicator_selected = {
            bg = mocha.base,
            fg = mocha.teal,
        },
        separator = {
            bg = mocha.mantle,
            fg = mocha.mantle,
        },
        tab_selected = {
            bg = mocha.text,
        },
        -- inactive buffers
        background = {
            bg = mocha.mantle,
            fg = mocha.subtext0,
        },
        close_button = {
            bg = mocha.mantle,
            fg = mocha.subtext0,
        },
        close_button_selected = {
            fg = mocha.red,
        }
    },
}
