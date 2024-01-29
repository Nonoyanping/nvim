-- import nvim-tree plugin safely
local setup, nvim_tree = pcall(require, "nvim-tree")
if not setup then
	return
end
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- [[Unsolved config]]
local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

-- local icons = require "user.icons"

local tree_cb = nvim_tree_config.nvim_tree_callback
--
-- local utils = require "nvim-tree.utils"
--
-- ---@diagnostic disable-next-line: unused-local
-- local function notify_level(level)
--   return function(msg)
--     vim.schedule(function()
--       vim.api.nvim_echo({ { msg, "WarningMsg" } }, false, {})
--     end)
--   end
-- end
--
-- utils.notify.warn = notify_level(vim.log.levels.WARN)
-- utils.notify.error = notify_level(vim.log.levels.ERROR)
-- utils.notify.info = notify_level(vim.log.levels.INFO)
-- utils.notify.debug = notify_level(vim.log.levels.DEBUG)
-- [[Unsolved config]]

nvim_tree.setup({
	hijack_directories = {
		enable = false,
	},
	-- update_to_buf_dir = {
	--   enable = false,
	-- },
	-- disable_netrw = true,
	-- hijack_netrw = true,
	-- open_at_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	filters = {
		custom = { ".git" },
		exclude = { ".gitignore" },
	},
	-- auto_close = true,
	-- open_on_tab = false,
	-- hijack_cursor = false,
	update_cwd = true,
	-- update_to_buf_dir = {
	--   enable = true,
	--   auto_open = true,
	-- },
	-- --   error
	-- --   info
	-- --   question
	-- --   warning
	-- --   lightbulb
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":t",
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					-- arrow_open = icons.ui.ArrowOpen,
					-- arrow_closed = icons.ui.ArrowClosed,
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			-- hint = icons.diagnostics.Hint,
			-- info = icons.diagnostics.Information,
			-- warning = icons.diagnostics.Warning,
			-- error = icons.diagnostics.Error,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	-- system_open = {
	--   cmd = nil,
	--   args = {},
	-- },
	-- filters = {
	--   dotfiles = false,
	--   custom = {},
	-- },
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	view = {
		-- width = 30,
		-- height = 30,
		hide_root_folder = false,
		side = "left",
		-- auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "u", action = "dir_up" },

				-- { key = 'L', cb = tree_cb('cd') },
				-- { key = '<C-s>', cb = tree_cb('split') },
				-- { key = '<C-v>', cb = tree_cb('vsplit') },
				-- { key = '<C-t>', cb = tree_cb('tabnew') },
				-- { key = 'h', cb = tree_cb('close_node') },
				-- { key = 'i', cb = tree_cb('preview') },
				-- { key = 'R', cb = tree_cb('refresh') },
				-- { key = 'c', cb = tree_cb('create') },
				-- { key = 'D', cb = tree_cb('remove') },
				-- { key = 'r', cb = tree_cb('rename') },
				-- { key = 'd', cb = tree_cb('cut') },
				-- { key = 'y', cb = tree_cb('copy') },
				-- { key = 'p', cb = tree_cb('paste') },
				-- { key = 'gyn', cb = tree_cb('copy_name') },
				-- { key = 'gyp', cb = tree_cb('copy_path') },
				-- {
				--   key = 'gya',
				--   cb = tree_cb('copy_absolute_path'),
				-- },
				-- { key = 'H', cb = tree_cb('dir_up') },
				-- { key = 's', cb = tree_cb('system_open') },
				-- { key = 'q', cb = tree_cb('close') },
			},
		},
		number = false,
		relativenumber = false,
	},
})
