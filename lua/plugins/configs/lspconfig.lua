dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- [[ Lsp Specific Settings ]]
local servers = {
  -- [[ Lsp ]]
  "clangd",
  "zls",
  "gopls",
  "jdtls",
  "lua_ls",

	"html",
	"cssls",
	"tsserver",
	"tailwindcss",
	"emmet_language_server",
	"eslint",

	-- "jsonls",
	-- "yamlls",

  -- Setup Rust_analyzer with rustaceanvim or rust_tools
  "rust_analyzer",
}


local formatter = {
  -- [[ Formatter]]
  "stylua", -- lua formatter
	"prettier",
}

for _, lsp in ipairs(servers) do
  -- if require("lspconfig")[lsp] and lsp ~= "lua-langauge-server" then
    require("lspconfig")[lsp].setup {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      settings = require("plugins.configs.server_config")[lsp]
    }
end

-- require("lspconfig").powershell_es.setup {
--   cmd = { 'pwsh', '-NoLogo', '-NoProfile', '-Command', "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1"},
--   single_file_support = true,
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
-- }

return M

-- TODO: Further Configuration
