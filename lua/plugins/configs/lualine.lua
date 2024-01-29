local options = {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

require('lualine').setup(options)




--[[
-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_nightfly,
	},
})
--]]

-- Set lualine as statusline
-- See `:help lualine.txt`
lualine.setup({
	options = {
		icons_enabled = true,
		-- section_separators = { left = '', right = '' },
		-- component_separators = { left = '', right = '' }
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = {
			left = " ",
			right = "",
		},
		component_separators = {
			-- left = "|",
			-- right = "|",
			left = " ",
			right = " ",
		},
		theme = "auto",
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		-- lualine_a = {
		-- 	{ "mode", separator = { left = "" }, right_padding = 2 },
		-- },
		lualine_a = {
			{ "mode" },
			-- 	{
			-- 		"buffers",
			-- 		show_filename_only = true, -- Shows shortened relative path when set to false.
			-- 		hide_filename_extension = false, -- Hide filename extension when set to true.
			-- 		show_modified_status = true, -- Shows indicator when the buffer is modified.
			--
			-- 		mode = 0, -- 0: Shows buffer name
			-- 		-- 1: Shows buffer index
			-- 		-- 2: Shows buffer name + buffer index
			-- 		-- 3: Shows buffer number
			-- 		-- 4: Shows buffer name + buffer number
			--
			-- 		max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
			-- 		-- it can also be a function that returns
			-- 		-- the value of `max_length` dynamically.
			-- 		filetype_names = {
			-- 			TelescopePrompt = "Telescope",
			-- 			dashboard = "Dashboard",
			-- 			packer = "Packer",
			-- 			fzf = "FZF",
			-- 			alpha = "Alpha",
			-- 		}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
			--
			-- 		-- buffers_color = {
			-- 		-- 	-- Same values as the general color option can be used here.
			-- 		-- 	active = "lualine_{section}_normal", -- Color for active buffer.
			-- 		-- 	inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
			-- 		-- },
			--
			-- 		symbols = {
			-- 			modified = " ●", -- Text to show when the buffer is modified
			-- 			alternate_file = "#", -- Text to show to identify the alternate file
			-- 			directory = "", -- Text to show when the buffer is a directory
			-- 		},
			-- 	},
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filetype",
				colored = true, -- Displays filetype icon in color if set to true
				icon_only = true, -- Display only an icon for filetype
				icon = { align = "right" }, -- Display filetype icon on the right hand side
				-- icon =    {'X', align='right'}
				-- Icon string ^ in table is ignored in filetype component
			},
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = false, -- Display new file status (new file means no write after created)
				path = 1, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[No Name]", -- Text to show for unnamed buffers.
					newfile = "[New]", -- Text to show for newly created file before first write
				},
			},
		},
		lualine_x = {
			"encoding",
			{
				"fileformat",
				symbols = {
					unix = "", -- e712
					dos = "", -- e70f
					mac = "", -- e711
				},
			},
			"filetype",
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
				color = { fg = "#ff9e64" },
			},
		},
		lualine_y = {
			{ "progress" },
		},
		lualine_z = { "location" },
		-- lualine_z = {
		-- 	{ "location", separator = { right = "" }, left_padding = 2 },
		-- },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = { require("tabline").tabline_buffers },
		-- lualine_a = { "buffers" },
		lualine_b = {},
		-- lualine_b = { "branch" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		-- lualine_z = { require("tabline").tabline_tabs },
		lualine_z = { "tabs" },
	},
	winbar = {},
	inactive_winbar = {},
	extensions = { "quickfix" },
})
