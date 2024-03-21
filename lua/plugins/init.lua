-- [[ Lazy.nvim related stuff ]]
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)

local plugins = require("plugins.pluglist")

local config = require("core.utils").load_config()

if #config.plugins > 0 then
	table.insert(plugins, { import = config.plugins })
end

require("lazy").setup(plugins, config.lazy_nvim)
