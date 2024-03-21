-- n, v, i, t = mode names
local M = {}

M.general = {
  i = {
    ["<C-e>"] = { "<End>", "End of line" },
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["jj"] = { "<ESC>", "Escape Insert Mode", opts = { nowait = true }},
  },

  n = {
    ["<C-c>"] = { "<cmd> noh <CR>", "Clear highlights" }, -- default -> ESC
    ["+"] = { "<C-a>", "Increment"},
    ["-"] = { "<C-x>", "Decrement"},

    -- switch between windows
    -- ["<C-h>"] = { "<C-w>h", "Window left" },
    -- ["<C-l>"] = { "<C-w>l", "Window right" },
    -- ["<C-j>"] = { "<C-w>j", "Window down" },
    -- ["<C-k>"] = { "<C-w>k", "Window up" },

    -- new buffer
    ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    ["<leader>fm"] = { function() vim.lsp.buf.format { async = true } end, "LSP formatting" },
    ["<leader>tt"] = { "<cmd> ToggleTransparency <CR>", "Toggle transparency" },
  },

  t = {
    ["<C-c>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },

  v = {
		["K"] = { ":move '<-2<CR>gv=gv", "move line 1 down"},
		["J"] = { ":move '>+1<CR>gv=gv", "move line 1 up"},
  },

  x = {
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<tab>"] = { function() require("nvchad.tabufline").tabuflineNext() end, "Goto next buffer" },
    ["<S-tab>"] = { function() require("nvchad.tabufline").tabuflinePrev() end, "Goto prev buffer" },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = { function() require("nvchad.tabufline").close_buffer() end, "Close buffer" },
  },
}

M.mason = {
  n = {
    ["<leader>ms"] = { "<cmd> Mason <CR>", "Toggle Mason Window" },
  },
}

M.comment = {
  plugin = true,

  n = {
    -- ["<leader>/"] = { function() require("Comment.api").toggle.linewise.current() end, "Toggle comment" },
  },

  v = {
    -- ["<leader>/"] = { "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "Toggle comment" },
  },
}

M.lspconfig = {
  plugin = true,
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gd"] = { function() vim.lsp.buf.definition() end, "LSP definition" },
    ["K"] = { function() vim.lsp.buf.hover() end, "LSP hover" },
    ["gi"] = { function() vim.lsp.buf.implementation() end, "LSP implementation" },
    ["<leader>ls"] = { function() vim.lsp.buf.signature_help() end, "LSP signature help" },
    ["<leader>D"] = { function() vim.lsp.buf.type_definition() end, "LSP definition type" },
    ["<leader>ra"] = { function() require("nvchad.renamer").open() end, "LSP rename" },
    ["<leader>ca"] = { function() vim.lsp.buf.code_action() end, "LSP code action" },
		["gD"] = { function() vim.lsp.buf.declaration() end, "LSP declaration" },
    ["gr"] = { function() vim.lsp.buf.references() end, "LSP references" },
    ["<leader>lf"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
    ["[d"] = { function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, "Goto prev" },
    ["]d"] = { function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, "Goto next" },
    ["<leader>q"] = { function() vim.diagnostic.setloclist() end, "Diagnostic setloclist" },
    ["<leader>wa"] = { function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder" },
    ["<leader>wr"] = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder" },
    ["<leader>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" },
  },
  v = {
    ["<leader>ca"] = { function() vim.lsp.buf.code_action() end, "LSP code action" },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  -- [Telescope Showcase]
  -- (https://github.com/nvim-telescope/telescope.nvim/wiki/Showcase)
  n = {
    -- find
    ["<leader>ff"] = { function ()
			require('telescope.builtin').find_files()
    end, "[F]ind [f]iles" },
    ["<leader>fa"] = { function ()
			require('telescope.builtin').find_files {
				follow = true, no_ignore = true, hidden = true
			}
    end, "[F]ind [A]ll" },
    ["<leader>fg"] = { function () require('telescope.builtin').live_grep()
    end, "[F]ind by [G]rep" },
    ["<leader>fs"] = { function () require('telescope.builtin').grep_string()
    end, "[F]ind [S]tring" },

    ["<leader>fc"] = { "<cmd> Telescope commands <CR>", "Find Commands" },
    ["<leader>fb"] = { function () require('telescope.builtin').buffers()
    end, "[F]ind [B]uffers" },
    ["<leader>fo"] = { function () require('telescope.builtin').oldfiles()
    end, "[F]ind [O]ldfiles" },
    ["<C-f>"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>/"] = { function ()
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })
    end, "[/] Fuzzily search in current buffer" },
    ["<leader>fh"] = { function () require('telescope.builtin').help_tags()
    end, "[F]ind [H]elp page" },
    ["<leader>fk"] = { function () require('telescope.builtin').keymaps()
    end, "[F]ind [K]eymaps" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    -- ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },

		-- something else
    ["<leader>sn"] = { function ()
			require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
		end, "[S]earch [N]eovim files" },
    ["<leader>ss"] = { function () require('telescope.builtin').builtin()
    end, "[S]earch [S]elect Telescope" },
    ["<leader>sr"] = { function () require('telescope.builtin').resum()
    end, "[S]earch [S]elect Telescope" },
    ["<leader>sd"] = { function () require('telescope.builtin').diagnostics()
    end, "[S]earch [D]iagnostics" },
    ["<leader>s/"] = { function () require('telescope.builtin').live_grep {
			grep_open_files = true,
			prompt_title = 'Live Grep in Open Files',
		} end, "[S]earch [/] in Open Files" },
  },
}


M.whichkey = {
  plugin = true,

  n = {
    ["<leader>wK"] = { function() vim.cmd "WhichKey" end, "Which-key all keymaps" },
    ["<leader>wk"] = { function()
        local input = vim.fn.input "WhichKey: " vim.cmd("WhichKey " .. input)
      end, "Which-key query lookup" },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
        vim.g.indent_blankline_context_patterns,
        vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>rh"] = { function() require("gitsigns").reset_hunk() end, "Reset hunk" },
    ["<leader>ph"] = { function() require("gitsigns").preview_hunk() end, "Preview hunk" },
    ["<leader>gb"] = { function() package.loaded.gitsigns.blame_line() end, "Blame line" },
    ["<leader>td"] = { function() require("gitsigns").toggle_deleted() end, "Toggle deleted" },
  },
}


-- ########################################
-- #            Plugin Keymapping         #
-- ########################################

M.todo_comments = {
  n = {
    ["]t"] = {function() require("todo-comments").jump_next() end, "Next todo comment" },
    ["[t"] = {function() require("todo-comments").jump_prev() end, "Previous todo comment" },
    ["]e"] = {function() require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" }}) end, "Next error/warning todo comment" },
    ["[e"] = {function() require("todo-comments").jump_prev({ keywords = { "ERROR", "WARNING" }}) end, "Previous error/warning todo comment" },
    -- :TodoTrouble cwd=~/projects/foobar
    -- :TodoTelescope keywords=TODO,FIX
    -- :TodoLocList
    -- :TodoQuickFix
    }
  }

M.hop = {
  n = {
    ["f"] = {function () require("plugins.configs.hop").hop_in_line("forward", 0) end, "Hop Enhanced f"},
    ["F"] = {function () require("plugins.configs.hop").hop_in_line("backward", 0) end, "Hop Enhanced F"},
    ["t"] = {function () require("plugins.configs.hop").hop_in_line("forward", -1) end, "Hop Enhanced t"},
    ["T"] = {function () require("plugins.configs.hop").hop_in_line("backward", -1) end, "Hop Enhanced T"},
    ["L"] = { function () require("plugins.configs.hop").hop_word_in_line() end, "Hop to words in current line"},
		["LL"] = { function () require'hop'.hint_lines_skip_whitespace() end, "Hop to line in current buffer"},
		["?"] = { function () require'hop'.hint_patterns() end, "hop enhanced ?" },
    ["<leader>hn"] = { "<cmd> HopNodes <CR>" , "Hop inside treesitter node" }, -- NOTE: Hop.hop_in_node function Cause error
  },
  v = {
    ["f"] = {function () require("plugins.configs.hop").hop_in_line("forward", 0) end, "Hop Enhanced f"},
    ["F"] = {function () require("plugins.configs.hop").hop_in_line("backward", 0) end, "Hop Enhanced F"},
    ["t"] = {function () require("plugins.configs.hop").hop_in_line("forward", -1) end, "Hop Enhanced t"},
    ["T"] = {function () require("plugins.configs.hop").hop_in_line("backward", -1) end, "Hop Enhanced T"},
  },
  o = {
    ["f"] = {function () require("plugins.configs.hop").hop_in_line("forward", 0) end, "Hop Enhanced f"},
    ["F"] = {function () require("plugins.configs.hop").hop_in_line("backward", 0) end, "Hop Enhanced F"},
    ["t"] = {function () require("plugins.configs.hop").hop_in_line("forward", -1) end, "Hop Enhanced t"},
    ["T"] = {function () require("plugins.configs.hop").hop_in_line("backward", -1) end, "Hop Enhanced T"},
  }
}

M.specs = {
  n = {
    ["n"] = { "n<cmd>lua require('specs').show_specs()<CR>", "Show specs when pressing n" },
    ["N"] = { "N<cmd>lua require('specs').show_specs()<CR>", "Show specs when pressing N" },
    ["<C-b>"] = { function () require('specs').show_specs({ winhl = "Search" }) end, "Show specs" },
    -- ["<leader>s"] = { function ()
    --   local opts = { width = 97, winhl = "Search", delay_ms = 610, inc_ms = 21 }
    --   require('specs').show_specs(opts)
    -- end, "Show specs"}
  }
}

M.trouble = {
  n = {
    ["<leader>xx"] = { function () require("trouble").toggle() end, "Toggle touble list" },
    ["<leader>xw"] = { function () require("trouble").toggle("workspace_diagnostics") end, "Toggle trouble | Workspace Diagnostics" },
    ["<leader>xd"] = { function () require("trouble").toggle("document_diagnostics") end, "Toggle trouble | Document Diagnostics" },
    ["<leader>xq"] = { function () require("trouble").toggle("quickfix") end, "Toggle trouble in QuickFixList" },
    ["<leader>xl"] = { function () require("trouble").toggle("loclist") end, "Toggle trouble in LocList" },
    ["gR"] = { function () require("trouble").toggle("lsp_references") end, "Toggle trouble | Lsp References" },
    ["<leader>tp"] = { function() require("trouble").previous({skip_groups = true, jump = true}) end, "Goto prev trouble" },
    ["<leader>tn"] = { function() require("trouble").next({skip_groups = true, jump = true}) end, "Goto next trouble" },

		-- jump to the first item, skipping the groups
		-- require("trouble").first({skip_groups = true, jump = true});

		-- jump to the last item, skipping the groups
		-- require("trouble").last({skip_groups = true, jump = true});


		-- E5108: Error executing lua: ...a/Local/nvim-data/lazy/trouble.nvim/lua/trouble/view.lua:392: Invalid window id: 1063
		-- stack traceback:
		-- 	[C]: in function 'get_cursor'
		-- 	...a/Local/nvim-data/lazy/trouble.nvim/lua/trouble/view.lua:392: in function 'get_line'
		-- 	...a/Local/nvim-data/lazy/trouble.nvim/lua/trouble/view.lua:427: in function 'previous_item'
		-- 	...a/Local/nvim-data/lazy/trouble.nvim/lua/trouble/init.lua:274: in function 'previous'
		-- 	C:\Users\snowm\AppData\Local\nvim/lua/core/mappings.lua:359: in function <C:\Users\snowm\AppData\Local\nvim/lua/core/mappings.lua:359>
  }
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>a"] = { function () require("harpoon"):list():append() end, "Add File to list" },
    ["<C-e>"] = { function () require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, "Toggle List View" },
    ["<C-h>"] = { function () require("harpoon"):list():select(1) end, "Goto File No.1" },
    ["<C-l>"] = { function () require("harpoon"):list():select(2) end, "Goto File No.2" },
    -- ["<C-S-N>"] = { function () require("harpoon"):list():next() end, "Goto Next File" },
    -- ["<C-S-P>"] = { function () require("harpoon"):list():prev() end, "Goto Prev File" },
  }
}

M.undotree = {
	n = {
		["<leader>u"] = { vim.cmd.UndotreeToggle , "Toggle Undotree"}
	}
}

return M
