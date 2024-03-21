local Server_config = {}

Server_config.clangd = {}

Server_config.rust_analyzer = {}

Server_config.zls = {}

Server_config.gopls = {
  completeUnimported = true,
  -- usePlaceholders = true,
}

Server_config.lua_ls ={
  Lua = {
    runtime = {
      version = 'LuaJIT'
    },

    diagnostics = {
      enable = true,
      globals = { "vim" },
    },
    workspace = {
      library = {
        -- Make the server aware of Neovim runtime files
        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
        [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
      },
      maxPreload = 100000,
      preloadFileSize = 10000,
    },
  },
}

-- "html",
-- "cssls",
-- "tsserver",
-- "tailwindcss",
-- "emmet_language_server",
-- "eslint",

return Server_config
