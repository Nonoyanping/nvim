local user_cmd = vim.api.nvim_create_user_command

-- [[ Function to install missing LSP ]]
user_cmd("LspToInstall", function()
  local mason = require('mason-registry')
  -- Lsps that want to install
  local lsps = require("plugins.configs.mason").ensure_installed
  -- List installed LSps by Mason
  local installed_lsps = mason.get_installed_package_names()

  local to_install = {}

  for _, lsp in ipairs(lsps) do
    if not vim.tbl_contains(installed_lsps, lsp) then
      table.insert(to_install, lsp)
    -- else
    --   print(lsp .. " is already installed")
    end
  end

  if #to_install > 0 then
    vim.cmd("MasonInstall " .. table.concat(to_install, " "))
  else
    print("All specified LSps are already installed")
  end
end, {})

-- TODO: Search a keyword in help docs

-- TODO: Make & Build in neovim

-- TODO: My own Plugin Load Functions

-- M.lazy_load = function(plugin)
--   vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
--     group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
--     callback = function()
--       local file = vim.fn.expand "%"
--       local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""
--
--       if condition then
--         vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)
--
--         -- dont defer for treesitter as it will show slow highlighting
--         -- This deferring only happens only when we do "nvim filename"
--         if plugin ~= "nvim-treesitter" then
--           vim.schedule(function()
--             require("lazy").load { plugins = plugin }
--
--             if plugin == "nvim-lspconfig" then
--               vim.cmd "silent! do FileType"
--             end
--           end, 0)
--         else
--           require("lazy").load { plugins = plugin }
--         end
--       end
--     end,
--   })
-- end

-- TODO: Use plenary.reload & autocmd to auto reload file
-- require("plenary.reload").reload_module "<module_to_reload>"
user_cmd("ConfigReload", function()
  vim.notify("ConfigReload Function get called!")
end, {})

-- TODO: A command for toggle transparency
user_cmd("ToggleTransparency", function()
  vim.notify("ToggleTransparency Function get called!")
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- require("plugins.configs.notify")
end, {})
