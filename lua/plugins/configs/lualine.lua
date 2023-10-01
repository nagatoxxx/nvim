-----------------
-- Status Line --
-----------------

-- Evil Line / Micro Line config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- Credit: Elai

local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#111111',
  fg       = '#ffffff',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#B7BD82',
  orange   = '#8d6141',
  violet   = '#B294BB',
  magenta  = '#AE84BB',
  blue     = '#96CDFB',
  red      = '#CC8282',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = 'catppuccin',
},
  extensions = {'nvim-tree', 'lazy'},

-- These are to remove the defaults
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
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

-- Icon Of Diffrent Mode: -- normal -- | -- insert -- | -- visual --
ins_left {
  -- mode component
  function()
    return ' ' end,
  color = function()

-- auto change color according to neovims mode
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
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = 1,
}

-- File Name
ins_left {
    'filename',
    file_status = true,                             -- Displays file status (readonly status, modified status)
    path = 0,                                       -- 0: Just the filename
    shorting_target = 100,                             -- Shortens path to leave 40 spaces in the window
    symbols = {
        modified = '[unsaved changes]', 
        readonly = '[readonly]',                        
        unnamed = '[no name]',                           -- Text to show for unnamed buffers.
    },
    padding = 1
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

ins_right { 'diff',source = diff_source}

-- Git Branch
ins_right {
  'branch',
  icon = '',
  -- icon = '',
  -- color = { fg = colors.green },
  -- padding = { right = 1 },
  -- padding = { left = 1 },
}

-- File Type
ins_right {
  'filetype',
  icon_only = false,
  padding = 1,
}


-- File Encoding
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  -- fmt = string.lower, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  padding = 1,
  -- color = { fg = colors.green, gui = 'bold' },
  -- Add components to right sections
}

ins_right {
    'diagnostics',
    source = {'nvim_diagnostics'},
    padding = 1,
}

-- File Location
ins_right {
  'location',
  padding = 1,
}

ins_left {
  function()
    return '%='
  end,
}

lualine.setup(config)

