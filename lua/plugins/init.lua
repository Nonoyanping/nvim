-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
local plugins = {

	"nvim-lua/plenary.nvim",

	{
		"NvChad/base46",
		branch = "v2.0",
		lazy = false,
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"NvChad/ui",
		branch = "v2.0",
		lazy = false,
	},

	-- ########################################
	-- #             colorschemes             #
	-- ########################################
	{
		"marko-cerovac/material.nvim",
		"rose-pine/neovim",
		"folke/tokyonight.nvim",
		"catppuccin/nvim",
		opts = function ()
			return require("plugins.configs.colorschemes").material
		end,
		config = function()
			local material_opts = require("plugins.configs.colorschemes").material
			local rose_opts = require("plugins.configs.colorschemes").rose_pine
			local tokyo_opts = require("plugins.configs.colorschemes").tokyonight
			local cat_opts = require("plugins.configs.colorschemes").catppuccin
			require('material').setup()
	-- 		require('rose-pine').setup(opts)
	-- 		require('tokyonight').setup(opts)
	-- 		require('catppuccin').setup(opts)
		end
	},

	{ "rktjmp/lush.nvim" },

	-- [[ Status line ]]
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- [[Jump arround]]
	{
		"smoka7/hop.nvim",
		version = "*",
		ft = "*",
		init = function ()
			local opts = require("plugins.configs.hop").opts
			require("hop").setup(opts)
			require("core.utils").load_mappings "hop"
		end,
	},

	-- Jump among files
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>a", mode = "n", desc = "Add File to List" },
			{ "<C-e>", mode = "n", desc = "Toggle List View" },
		},
		init = function()
			require("harpoon"):setup()
			require("core.utils").load_mappings "harpoon"
		end,
	},

	-- [[ Thing that don't load ]]
	{
		"kylechui/nvim-surround",
		"gbprod/substitute.nvim",
		"nvim-pack/nvim-spectre",
		init = function ()
			require("core.utils").lazy_load "nvim-surround"
		end
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "]t", mode = "n", desc = "Next todo comment" },
			{ "[t", mode = "n", desc = "Previous todo comment" },
		},
		init = function ()
			local opts = require("plugins.configs.todo_comment")
			require("todo-comments").setup(opts)
		end,
	},

	-- Prismatic line decorations for the adventurous vim user
	{
		"mvllow/modes.nvim", tag = 'v0.2.0',
		init = function ()
			require("core.utils").lazy_load "modes.nvim"
			local opts = require("plugins.configs.modes")
			require("modes").setup(opts)
		end,
	},

	{
		"folke/trouble.nvim",
		config = function ()
			local opts = require("plugins.configs.trouble")
			require("trouble").setup(opts)
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"edluffy/specs.nvim",
		ft = "*",
		init = function ()
			local opts = require('plugins.configs.specs').opts
			require("specs").setup(opts)
		end,
	},

	{
		"folke/noice.nvim",
		init = function ()
			require("plugins.configs.noice")
		end,
		dependencies = {
			{ "MunifTanjim/nui.nvim", },
			{
				"rcarriga/nvim-notify",
				init = function ()
					require("plugins.configs.notify")
				end
			},
		}
	},

	{
		"echasnovski/mini.indentscope",
		version = false,
		opts = function ()
			-- return
		end
	},

	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		init = function ()
			require("plugins.configs.undotree")
		end
	},

	-- [[ Neovim Dev]]
	-- Neovim setup for init.lua and plugin development with full signature help,
	-- docs and completion for the nvim lua API.
	-- NOTE: Should be setup BEFORE lspconfig
	{
		"folke/neodev.nvim",
		lazy = false,
	},

	{
		"NvChad/nvim-colorizer.lua",
		init = function()
			require("core.utils").lazy_load "nvim-colorizer.lua"
		end,
		config = function(_, opts)
			require("colorizer").setup(opts)

			-- execute colorizer as soon as possible
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
				end, 0)
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return { override = require "nvchad.icons.devicons" }
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "devicons")
			require("nvim-web-devicons").setup(opts)
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		version = "2.20.7",
		init = function()
			require("core.utils").lazy_load "indent-blankline.nvim"
		end,
		opts = function()
			return require("plugins.configs.blankline")
		end,
		config = function(_, opts)
			require("core.utils").load_mappings "blankline"
			dofile(vim.g.base46_cache .. "blankline")
			require("indent_blankline").setup(opts)
			-- require("ibl").setup(opts)
		end,
	},


	-- [[ Treesitter Related ]]
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			require("core.utils").lazy_load "nvim-treesitter"
		end,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("plugins.configs.treesitter").parser_config
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "syntax")
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		init = function()
			require("core.utils").lazy_load "nvim-treesitter-textobjects"
			require("core.utils").lazy_load "playground"
		end,
		config = function ()
			local textobj_opt = require("plugins.configs.treesitter").textobjects
			local play_opt = require("plugins.configs.treesitter").playground
			local query_opt = require("plugins.configs.treesitter").query_linter
			local opts = vim.tbl_deep_extend("error", textobj_opt, play_opt,  query_opt)
			require("nvim-treesitter.configs").setup(opts)
		end
	},

	-- {
	-- 	"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	init = function()
	-- 		require("core.utils").lazy_load "nvim-treesitter-textobjects"
	-- 	end,
	-- 	config = function ()
	-- 		local opts = require("plugins.configs.treesitter").textobjects
	-- 		require("nvim-treesitter.configs").setup(opts)
	-- 	end
	-- },

	-- [[ Thing that don't load ]]
	{
		"windwp/nvim-ts-autotag",
		-- Highlight arguments' definitions and usages, using Treesitter
	},

	{
		"m-demare/hlargs.nvim",
		config = function ()
			require("plugins.configs.hlargs")
		end
	},


	-- [[ Git Stuff ]]
	{
		"lewis6991/gitsigns.nvim",
		ft = { "gitcommit", "diff" },
		init = function()
			-- load gitsigns only when a git file is opened
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
				callback = function()
					vim.fn.jobstart({"git", "-C", vim.loop.cwd(), "rev-parse"},
						{
							on_exit = function(_, return_code)
								if return_code == 0 then
									vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
									vim.schedule(function()
										require("lazy").load { plugins = { "gitsigns.nvim" } }
									end)
								end
							end
						}
					)
				end,
			})
		end,
		opts = function()
			return require("plugins.configs.gitsigns")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "git")
			require("gitsigns").setup(opts)
		end,
	},

	-- [[ Lsp Related ]]
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "LspInstall" },
		opts = function()
			return require "plugins.configs.mason"
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "mason")
			require("mason").setup(opts)

			-- custom nvchad cmd to install all mason binaries listed
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	{
		"neovim/nvim-lspconfig",
		init = function()
			require("core.utils").lazy_load "nvim-lspconfig"
		end,
		dependencies = "folke/neodev.nvim",
		config = function()
			require "plugins.configs.lspconfig"
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		cmd = {""},
		config = function ()
			return require("plugins.configs.none_ls")
		end
	},

	-- [[ Thing that don't load ]]
	{
		"nvimdev/lspsaga.nvim",
		"stevearc/conform.nvim",
		"mfussenegger/nvim-lint"
	},


	-- #############################
	-- # Language Specific Plugins #
	-- #############################

	-- [[ Rust ]]
	{ -- for auto formatting
		"rust-lang/rust.vim",
		ft = "rust",
		init = function ()
			vim.g.rustfmt_autosave = 1
		end
	},

	{
		"mrcjkb/rustaceanvim",
		version = '^3', -- Recommended
		ft = { 'rust' },
	},

	-- [[ C/C++ ]]
	{
		"p00f/clangd_extensions.nvim"
	},

	-- [[ Golnag ]]
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = {"CmdlineEnter"},
		ft = {"go", 'gomod'},
		-- if you need to install/update all binaries
		-- build = ':lua require("go.install").update_all_sync()'
	},

	-- [[ Debug Related ]]
	{ "mfussenegger/nvim-dap" },

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap"}
	},
	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip", -- Snippets Engine
				dependencies = "rafamadriz/friendly-snippets", -- a collection of useful Snippets
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("plugins.configs.luasnip").luasnip(opts)
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require "nvim-autopairs.completion.cmp"
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			-- "hrsh7th/cmp-nvim-lsp-signature-help",
			-- "hrsh7th/cmp-cmdline",
			-- "lukas-reineke/cmp-under-comparator",
			-- "ray-x/cmp-treesitter",
			{
				-- Allow nvim-cmp to show Snippets in autocompletion
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require "plugins.configs.cmp"
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		init = function()
			require("core.utils").load_mappings "comment"
		end,
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	-- file managing , picker etc
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		init = function()
			require("core.utils").load_mappings "nvimtree"
		end,
		opts = function()
			return require "plugins.configs.nvimtree"
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "nvimtree")
			require("nvim-tree").setup(opts)
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		init = function()
			require("core.utils").load_mappings "telescope"
		end,
		opts = function()
			return require "plugins.configs.telescope"
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "telescope")
			local telescope = require "telescope"
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},

	-- Only load whichkey after all the gui
	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		init = function()
			require("core.utils").load_mappings "whichkey"
		end,
		cmd = "WhichKey",
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "whichkey")
			require("which-key").setup(opts)
		end,
	},

	{
		"folke/zen-mode.nvim",
		opts = function ()
			return require("plugins.configs.focus").zen_mode
		end
	},

	{
		"folke/twilight.nvim",
		opts = function ()
			return require("plugins.configs.focus").twilight
		end
	}
}

local config = require("core.utils").load_config()

if #config.plugins > 0 then
	table.insert(plugins, { import = config.plugins })
end

require("lazy").setup(plugins, config.lazy_nvim)
