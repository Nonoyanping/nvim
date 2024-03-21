-- test.lua in the custom directory
-- File: ~/.config/nvim/lua/custom/test.lua
-- require("plenary.reload").reload_module "core.default_config"
local user_cmd = vim.api.nvim_create_user_command

-- [[ Reload Testing ]]
user_cmd("Echo_Hello", function()
  vim.notify("Hello From custom.test.lua!")
end, {})

