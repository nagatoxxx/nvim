local lualine = require('lualine')
local mocha = require('catppuccin.palettes').get_palette "mocha"

local colors = {
    fg = mocha.text,
    yellow = mocha.yellow,
    cyan = mocha.teal,
    green = mocha.green,
    orange = mocha.peach,
	violet	 = mocha.mauve,
    magenta = mocha.lavender,
    blue = mocha.sapphire,
    red = mocha.red,
    black = mocha.crust,
    gray = mocha.surface0,
    dim = mocha.surface2
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
        -- globalstatus=true,
		component_separators = '',
		section_separators = '',
		theme = 'catppuccin',
		disabled_filetypes = {
            'toggleterm',
            'Outline',
            'NvimTree',
		},
	},

    extensions = {'nvim-tree', 'lazy', 'mason'},

    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left {
	-- mode component
	function()
        return vim.fn.mode()
	end,

	color = function()
	local mode_color = {
		n = colors.green,
		i = colors.blue,
		v = colors.magenta,
		[''] = colors.blue,
		V = colors.blue,
		c = colors.red,
		no = colors.red,
		s = colors.orange,
		S = colors.orange,
		[''] = colors.orange,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		['r?'] = colors.cyan,
		['!'] = colors.red,
		t = colors.red,
	}
	return { fg = colors.black, bg = mode_color[vim.fn.mode()] }
	end,
	padding = 1,
}

-- File Name
ins_left {
	'filename',
	file_status = true,							 -- Displays file status (readonly status, modified status)
	path = 0,										 -- 0: Just the filename
	shorting_target = 100,							 -- Shortens path to leave 40 spaces in the window
	symbols = {
        modified = '[+]',
        readonly = '[ro]',
        unnamed = '[no name]',							 -- Text to show for unnamed buffers.
	},
	padding = 1,
	color = {fg = colors.fg, bg = colors.gray},
}

-- Git Diff
local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

local function lsp_server()
    local servers = vim.lsp.get_clients()
    return servers[#servers].name
end

ins_left {
    lsp_server,
    padding = 1,
    color = {fg = colors.dim}
}

ins_right {
    'diff',
    source = diff_source
}

-- Git Branch
ins_right {
	'branch',
}


-- Diagnostics
ins_left {
	'diagnostics',
	source = {'nvim_diagnostics'},
	padding = 1,
}

-- File Type
ins_right {
	'filetype',
	icon_only = false,
	padding = 1,
    color = {fg = colors.fg, bg = colors.gray}
}

-- File Location
ins_right {
	'location',
	padding = 1,
	color = {fg = colors.black, bg = colors.magenta},
}

lualine.setup(config)
