local Treesitter = {}

Treesitter.parser_config = {
  ensure_installed = {
    -- [[ defaults ]]
    "vim",
    "vimdoc",
    "lua",
    "query",
    "markdown",

    -- [[web dev]]
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "yaml",
    -- "vue", "svelte",

    -- [[ relative low level ]]
    "rust",
    "c",
    "cpp",
    "zig",
    "go",
    "java",
  },

  highlight = {
    enable = true,
    use_languagetree = true
  },

  incremental_selection = {
    disable = {},
    enable = true,
    keymaps = {
      -- init_selection = '<c-space>',
      -- node_incremental = '<c-space>',
      -- scope_incremental = '<c-s>',
      -- node_decremental = '<c-backspace>',
      init_selection = "gnn",
      node_decremental = "grm",
      node_incremental = "grn",
      scope_incremental = "grc",
    },
    module_path = "nvim-treesitter.incremental_selection"
  },

  indent = {
    disable = { "python", "css", "rust" },
    enable = true,
    loaded = true,
    module_path = "nvim-treesitter.indent"
  },
}


-- ##########
-- [[ Treesitter Modules ]]
Treesitter.textobjects = {
  textobjects = {
    select = {
      enable = true,

      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim

      keymaps = {
				-- ################################################################################
        -- ["af"] = "@function.outer",
        -- ["if"] = "@function.inner",
        -- ["at"] = "@class.outer",
        -- ["it"] = "@class.inner",
        -- ["ac"] = "@call.outer",
        -- ["ic"] = "@call.inner",
        -- ["aa"] = "@parameter.outer",
        -- ["ia"] = "@parameter.inner",
        -- ["al"] = "@loop.outer",
        -- ["il"] = "@loop.inner",
        -- ["ai"] = "@conditional.outer",
        -- ["ii"] = "@conditional.inner",
        -- ["a/"] = "@comment.outer",
        -- ["i/"] = "@comment.inner",
        -- ["ab"] = "@block.outer",
        -- ["ib"] = "@block.inner",
        -- ["as"] = "@statement.outer",
        -- ["is"] = "@scopename.inner",
        -- ["aA"] = "@attribute.outer",
        -- ["iA"] = "@attribute.inner",
        -- ["aF"] = "@frame.outer",
        -- ["iF"] = "@frame.inner",
				-- ################################################################################

        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },

    swap = {
      enable = true,
      swap_next = {
        ["<leader>i"] = "@parameter.inner",
        -- ["<leader>s"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>I"] = "@parameter.inner",
        -- ["<leader>S"] = "@parameter.inner",
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        -- ["]d"] = "@conditional.outer",
        ["<leader>]"] = "@conditional.outer",
      },
      goto_previous = {
        -- ["[d"] = "@conditional.outer",
        ["<leader>["] = "@conditional.outer",
      }
    },

    lsp_interop = {
      enable = true,
      border = 'none',
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}

Treesitter.playground = {
  playground = {
    enable = true,
    disable = {},
    -- Debounced time for highlighting nodes in the playground from source code
    updatetime = 25,

    -- Whether the query persists across vim sessions
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

Treesitter.query_linter = {
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
}

-- nvim-treesitter-pairs
-- nvim-treesitter-context
-- nvim-ts-rainbow2
-- crazy-node-movement
-- nvim-ts-autotag

-- Treesitter.rainbow = {
--   rainbow = {
--     enable = true,
--     extended_mode = false,
--     colors = {
--       -- "#68a0b0",
--       -- "#946EaD",
--       -- "#c7aA6D",
--       "Gold",
--       "Orchid",
--       "DodgerBlue",
--       -- "Cornsilk",
--       -- "Salmon",
--       -- "LawnGreen",
--     },
--     disable = { "html" },
--   },
-- }

  -- matchup = {
  --   enable = true, -- mandatory, false will disable the whole extension
  --   disable_virtual_text = true,
  --   disable = { "html" }, -- optional, list of language that will be disabled
  --   -- include_match_words = false
  -- },

  -- autopairs = {
  --   enable = true,
  -- },

  -- autotag = {
  --   enable = true,
  --   disable = { "xml", "markdown" },
  -- },

  -- rainbow = {
  --   enable = true,
  --   extended_mode = false,
  --   colors = {
  --     -- "#68a0b0",
  --     -- "#946EaD",
  --     -- "#c7aA6D",
  --     "Gold",
  --     "Orchid",
  --     "DodgerBlue",
  --     -- "Cornsilk",
  --     -- "Salmon",
  --     -- "LawnGreen",
  --   },
  --   disable = { "html" },
  -- },

return Treesitter
